//
//  loginRegisterController.m
//  roomRelarion
//
//  Created by Apple on 2017/4/7.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "loginRegisterController.h"
#import "UIButton+extension.h"
#import <AFNetworking.h>
#import "AppUtil.h"

#import <EaseMob.h>
#import <SVProgressHUD/SVProgressHUD.h>


//#import <EaseMobSDKFull/EaseMob.h>


@interface loginRegisterController ()

{
    
    UIButton *registerBtn;//注册按钮
    OLGhostAlertView *_ghostView;//提示框
}

//注册
@property (nonatomic,strong) UITextField *accountName;//真实姓名
@property (nonatomic,strong) UITextField *rpwd;// 设置密码
@property (nonatomic,strong) UITextField *nickName;//个人昵称
@property (nonatomic,strong) UITextField *rphone;//手机号码
@property (nonatomic,strong) UITextField *Verification;//验证码
@property (nonatomic,strong) UITextField *repwd;// 确认密码

//登录
@property (nonatomic,strong) UIView *registerView;//注册视图
@property (nonatomic,strong)  UIView *loginView;//登录视图
@property (nonatomic,strong) UITextField *LPhoneField;//手机号
@property (nonatomic,strong) UITextField *LPwdField;//密码

@end

static CGFloat accountName_x = 80;
static CGFloat accountName_y = 100;
static CGFloat accountName_height = 30;





@implementation loginRegisterController

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    //注册
    [self registerInterface];
    
    //登录
    [self  loginInterface];
    
    //返回按钮
    UIButton *backButton = [UIButton setTitle:@"取消" color:[UIColor blackColor] frame:CGRectMake(10, 10, 60, 40) addTarget:self action:@selector(backClick)];
    [self.view addSubview:backButton];

      //手势
    [self tapGestureRecognizer];
    
    _ghostView = [[OLGhostAlertView alloc] initWithTitle:nil message:nil timeout:0.5 dismissible:YES];
    _ghostView.position = OLGhostAlertViewPositionCenter;
    
}
#pragma mark - 手势
- (void)tapGestureRecognizer{
  
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenKeyBord)];
    [self.view addGestureRecognizer:gesture];
}

#pragma mark - 隐藏键盘
- (void)hiddenKeyBord{
    
    [self.view endEditing:YES];
}



#pragma mark - 登录界面
- (void)loginInterface{
    //登录视图
    _loginView = [[UIView alloc]initWithFrame:self.view.frame];
    [_loginView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_loginView];
    
    //手机号
   _LPhoneField = [UITextField setFrame:CGRectMake(80, 150, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"请输入手机号"];
    _LPhoneField.keyboardType = UIKeyboardTypeNumberPad;
    [_loginView addSubview:_LPhoneField];
    //密码
    _LPwdField = [UITextField setFrame:CGRectMake(80, 200, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"请输入密码"];
    _LPwdField.secureTextEntry = YES;
    [_loginView addSubview:_LPwdField];
    
    //立即登录
    UIButton *loginBt = [UIButton setTitle:@"立即登录" BackgroundColor:[UIColor orangeColor] frame:CGRectMake(80, 250, XM_Width -80-80, 30) addTarget:self action:@selector(loginOperation)];
   
    [_loginView addSubview:loginBt];
    
    //跳转登录
    UIButton *loginJump = [UIButton setTitle:@"注册账号" color:[UIColor blackColor] frame:CGRectMake(300, 10, 60, 40) addTarget:self action:@selector(exchangeSubview)];
    [_loginView addSubview:loginJump];
}

#pragma mark - 注册界面
- (void)registerInterface{
    //注册视图
    _registerView = [[UIView alloc]initWithFrame:self.view.frame];
    [_registerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_registerView];
    
    //跳转注册
    UIButton *registerJump = [UIButton setTitle:@"已有账号" color:[UIColor blackColor] frame:CGRectMake(300, 10, 60, 40) addTarget:self action:@selector(exchangeSubview)];
    [_registerView addSubview:registerJump];
    
   CGFloat cwidth = (XM_Width - 80 - 80);
    //名字
    _accountName = [UITextField setFrame:CGRectMake(accountName_x, accountName_y, cwidth, accountName_height) borderStyle:UITextBorderStyleRoundedRect placeholder:@"真实姓名"];

    
    [_registerView addSubview:_accountName];
    
    
    //显示姓名
    UIButton *visible = [UIButton buttonWithType:UIButtonTypeCustom];
    [visible setFrame:CGRectMake(150, 5, 60, 20)];
    [visible setBackgroundColor:[UIColor blueColor] ];
    [visible setTitle:@"是否显示" forState:UIControlStateNormal];
    [visible setFont:[UIFont systemFontOfSize:10]];
    [visible.layer setCornerRadius:9];
    visible.tag = 1000;
    [visible addTarget:self action:@selector(visibleName:) forControlEvents:UIControlEventTouchUpInside];
    [_accountName addSubview:visible];
    
    
    //个人昵称
  _nickName = [UITextField setFrame:CGRectMake(accountName_x, accountName_y + accountName_height +10, cwidth, accountName_height) borderStyle:UITextBorderStyleRoundedRect placeholder:@"个人昵称"];
    [_registerView addSubview:_nickName];
    
    //手机号码
    _rphone = [UITextField setFrame:CGRectMake(accountName_x, accountName_y + (accountName_height  +10) *2, cwidth, accountName_height) borderStyle:UITextBorderStyleRoundedRect placeholder:@"手机号码"];
    _rphone.keyboardType = UIKeyboardTypeNumberPad;
    [_registerView addSubview:_rphone];
    //验证码
    _Verification = [UITextField setFrame:CGRectMake(accountName_x, accountName_y + (accountName_height  +10) *3, cwidth, accountName_height) borderStyle:UITextBorderStyleRoundedRect placeholder:@"验证码"];
    [_registerView addSubview:_Verification];
    
    //获取验证码
    UIButton *toValidation = [UIButton buttonWithType:UIButtonTypeCustom];
    [toValidation setFrame:CGRectMake(150, 5, 60, 20)];
    [toValidation setBackgroundColor:[UIColor blueColor]];
    [toValidation setTitle:@"获取验证码" forState:UIControlStateNormal];
    [toValidation setFont:[UIFont systemFontOfSize:10]];
    [toValidation.layer setCornerRadius:9];
    [toValidation addTarget:self action:@selector(clickValidation) forControlEvents:UIControlEventTouchUpInside];
    [_Verification addSubview:toValidation];
    
    //设置密码
   _rpwd = [UITextField setFrame:CGRectMake(accountName_x, accountName_y + (accountName_height  +10) *4, cwidth, accountName_height) borderStyle:UITextBorderStyleRoundedRect placeholder:@"设置密码"];
    _rpwd.secureTextEntry = YES;
    [_registerView addSubview:_rpwd];
    
    //确认密码
    _repwd = [UITextField setFrame:CGRectMake(accountName_x, accountName_y + (accountName_height  +10) *5, cwidth, accountName_height) borderStyle:UITextBorderStyleRoundedRect placeholder:@"确认密码"];
    _repwd.secureTextEntry = YES;
    [_registerView addSubview:_repwd];
    //勾选按钮
    UIButton *checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkBox setFrame:CGRectMake(accountName_x ,accountName_y + (accountName_height  +10) *6, 20, 20)];
    [checkBox setImage:[UIImage imageNamed:@"icon_ CheckBox"] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"icon_ CheckBox_selectd"] forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(checkBoxSelectd:) forControlEvents:UIControlEventTouchUpInside];
    checkBox.backgroundColor = [UIColor clearColor];
    [_registerView addSubview:checkBox];
    
    //房亲会条款
    UIButton *terms = [UIButton buttonWithType:UIButtonTypeCustom];
    [terms setFrame:CGRectMake(accountName_x + 20,accountName_y + (accountName_height  +10) *6, cwidth - 20, 20)];
    [terms setTitle:@"我已阅读并同意《房亲会服务条款》" forState:UIControlStateNormal];
    [terms setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [terms setFont:[UIFont systemFontOfSize:11]];
    [terms setBackgroundColor:[UIColor clearColor]];
    [terms addTarget:self action:@selector(clickTerms) forControlEvents:UIControlEventTouchUpInside];
    [_registerView addSubview:terms];
    
    //立即注册
    registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setFrame:CGRectMake(accountName_x,accountName_y + (accountName_height  +10) *7, cwidth, accountName_height)];
    [registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    [registerBtn setFont:[UIFont systemFontOfSize:14]];
    [registerBtn setBackgroundColor:[UIColor grayColor]];
    [registerBtn.layer setCornerRadius:9];
    
    [_registerView addSubview:registerBtn];
    
    
}
#pragma mark - 勾选
- (void)checkBoxSelectd:(UIButton *)button{
    
    button.selected = !button.selected;
    if (button.selected) {
        [registerBtn setBackgroundColor:[UIColor orangeColor]];
        [registerBtn addTarget:self action:@selector(registerOperation) forControlEvents:UIControlEventTouchUpInside];
    }else{
   [registerBtn setBackgroundColor:[UIColor grayColor]];
        [registerBtn removeTarget:self action:@selector(registerOperation) forControlEvents:UIControlEventTouchUpInside];
    }
    
}


#pragma mark - 条款
- (void)clickTerms{
    XMFunc;
    
}

#pragma mark - 是否显示
- (void)visibleName:(UIButton *)button
{
    button.tag = (NSInteger)[self.view viewWithTag:1000];
    button.selected = !button.selected;
    if (!button.selected) {
        NSLog(@"不显示");
    }else{
        NSLog(@"显示");
    }
    XMFunc;
}

#pragma mark - 获取验证码
- (void)clickValidation{
    
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //2、拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"phone"] = self.rphone.text;
    parameters[@"type"] = @"3";

    
    //3、发送请求
    [mgr POST:@"http://mob.fangqinhui.com/broker/sendCode.do" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        NSLog(@"%@-------------------",responseObject);
        
        NSString *msg = [responseObject objectForKey:@"msg"];
        NSLog(@"--------------------%@",msg);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
    
}

#pragma mark - 登录操作
- (void)loginOperation{
    [self hiddenKeyBord];
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:self.LPhoneField.text
                                                        password:self.LPwdField.text
                                                      completion:^(NSDictionary *loginInfo, EMError *error) {
                                                          NSLog(@"error = %@",error);
                                                          if (!error && loginInfo) {
                                                              NSLog(@"登录成功");
                                                  
                                                              //登录成功自动登录
                                                              [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
                                                              [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                                                              [SVProgressHUD dismissWithDelay:2];
                                                              
                                                          }
//                                                          else{
//                                              [SVProgressHUD showErrorWithStatus:@"登录失败"];
//                                                  [SVProgressHUD dismissWithDelay:2];
//                                                          }
                
              
              
                                                          NSLog(@"%s,line = %d",__FUNCTION__,__LINE__);
                                                      } onQueue:nil];
    
//    if ([AppUtil checkTel:_LPhoneField.text]) {
//        //进行网络请求
//        [self requestDataIsSee:NO];
//    }else{
//        _ghostView.message = @"请输入账号和密码";
//        [_ghostView show];
//    }
    
    
    
   
    
}
#pragma mark - 登录请求网络
- (void)requestDataIsSee:(BOOL)isSee{
    
    /*
     1、请求数据；
     1）需要AF框架；
     2、返回数据；
     3、解析数据；
     
     */
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //获取账号密码
    NSString *userPhone = self.LPhoneField.text;
    NSString *password = self.LPwdField.text;
    
    //2、请求参数
    NSDictionary *parameters = @{@"phone":userPhone,
                                 @"pwd":password
                                 };
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:userPhone forKey:@"phone"];
    [userDefault setObject:password forKey:@"password"];
    [userDefault synchronize];

    if (([userPhone isEqualToString:@"18608975731"])
        && ([password isEqualToString:@"123456"]))
    {
        if ([AppUtil isExistKeychain]) {
            [SSKeychain passwordDataForService:kService account:@"account"];
        }
        NSDictionary *data = [NSDictionary dictionaryWithObject:_LPhoneField.text forKey:@"phone"];
        NSMutableData *dat = [AppUtil dictionaryTodata:data];
        [AppUtil writeToKeychain:dat];
        _ghostView.message = @"登录成功";
    }else{
        _ghostView.message = @"账号或密码错误，请重新输入";
    }
    [_ghostView show];
    
    

    
//    //url (yale-dev.s1.natapp.cc)
//    NSString *urlString = @"http://mob.fangqinhui.com/broker/login.do";
//    //3、发送请求
//    [mgr POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"请求成功，服务器返回的信息%@",responseObject);
//        NSString *msg = [responseObject objectForKey:@"msg"];
//        
//        NSLog(@"--------------------%@",msg);
//        
////        if ([msg isEqualToString:@"登录超时，请重新登录。"]) {
////            [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(loginLoad) userInfo:nil repeats:NO];
////            
////        }else if([msg isEqualToString:@"登录失败,请检查手机号码或密码"]){
////            
////            [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(loginFail) userInfo:nil repeats:NO];
////        }else if ([msg isEqualToString:@"0"]){
////            [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(loginOk) userInfo:nil repeats:NO];
////        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        //        NSLog(@"%@",error);
//        
//    }];
}

#pragma mark - 重新刷新
- (void)loginLoad{
    
    
   UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"当前微信用户的openId不存在,请重新刷新" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertC addAction:okAction];
    [self presentViewController:alertC animated:YES completion:nil];
}

#pragma mark - 登录失败
- (void)loginFail{
    
    
 UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"登录失败" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertC addAction:okAction];
    [self presentViewController:alertC animated:YES completion:nil];
}

#pragma mark - 登录成功
- (void)loginOk{
    
    XMFunc;
    //
}

#pragma mark - 注册操作
- (void)registerOperation{
    
    [self hiddenKeyBord];
    
//    if (![_repwd.text isEqualToString:_rpwd.text]) {
//        _ghostView.message = @"密码不一致";
//        [_ghostView show];
//    }else if ([AppUtil checkTel:_rphone.text] &&(_rphone.text.length>0) && (_rpwd.text.length > 0)){
//        [self requestData];
//    }else {
//        _ghostView.message = @"请按要求输入账号和密码";
//        [_ghostView show];
//    }
    
    [self test];
    
}

//block 异步注册
- (void)test {
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:self.rphone.text
                                                         password:self.rpwd.text
                                                   withCompletion:^(NSString *username, NSString *password, EMError *error) {
                                                       [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
                                            
                                                       [SVProgressHUD showSuccessWithStatus:@"注册成功"];
                                                       [SVProgressHUD dismissWithDelay:2];
        NSLog(@"%s,line = %d",__FUNCTION__,__LINE__);
    } onQueue:nil];//设置回调在哪个线程
    
}

#pragma mark - 注册请求网络
- (void)requestData{
    NSDictionary *data;
    //存储密码
    if ([AppUtil isExistKeychain]) {
        [SSKeychain deletePasswordForService:kService account:@"account"];
    }
    NSMutableData *dat = [AppUtil dictionaryTodata:data];
    [AppUtil writeToKeychain:dat];
        // 1.创建请求会话管理者
        AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
        //2、拼接参数
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"name"] = _accountName.text;
//        parameters[@"nickname"] = _nickName.text;
        parameters[@"phone"] = _rphone.text;
    //    parameters[@"code"] = _Verification.text;
        parameters[@"pwd"] = _rpwd.text;
        parameters[@"repwd"] = _repwd.text;

        //3、发送请求 (yale-dev.s1.natapp.cc)
        [mgr POST:@"http://mob.fangqinhui.com/broker/register.do" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@-------------------",responseObject);
    
            NSString *msg = [responseObject objectForKey:@"msg"];
            NSLog(@"--------------------%@",msg);
            
    
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    
}

#pragma mark - 点击返回上一界面
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 翻转界面
- (void)exchangeSubview{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [self hiddenKeyBord];
    [UIView commitAnimations];
    
}


@end
