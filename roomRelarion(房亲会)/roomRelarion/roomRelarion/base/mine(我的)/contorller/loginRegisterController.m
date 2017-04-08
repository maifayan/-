//
//  loginRegisterController.m
//  roomRelarion
//
//  Created by Apple on 2017/4/7.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "loginRegisterController.h"
#import "UIButton+extension.h"

@interface loginRegisterController ()


@property (nonatomic,strong) UIView *registerView;//注册视图
@property (nonatomic,strong)  UIView *loginView;//登录视图

@end

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
    
}
//手势
- (void)tapGestureRecognizer{
  
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenKeyBord)];
    [self.view addGestureRecognizer:gesture];
}

//隐藏键盘
- (void)hiddenKeyBord{
    
    [self.view endEditing:YES];
}

//登录界面
- (void)loginInterface{
    //登录视图
    _loginView = [[UIView alloc]initWithFrame:self.view.frame];
    [_loginView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_loginView];
    
    //手机号
   UITextField *phoneField = [UITextField setFrame:CGRectMake(80, 150, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"请输入手机号"];
    phoneField.keyboardType = UIKeyboardTypeNumberPad;
    [_loginView addSubview:phoneField];
    //密码
    UITextField *pwdField = [UITextField setFrame:CGRectMake(80, 200, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"请输入密码"];
    [_loginView addSubview:pwdField];
    
    //立即登录
    UIButton *loginBt = [UIButton setTitle:@"立即登录" BackgroundColor:[UIColor orangeColor] frame:CGRectMake(80, 250, XM_Width -80-80, 30) addTarget:self action:@selector(loginOperation)];
   
    [_loginView addSubview:loginBt];
    
    //跳转登录
    UIButton *loginJump = [UIButton setTitle:@"注册账号" color:[UIColor blackColor] frame:CGRectMake(300, 10, 60, 40) addTarget:self action:@selector(exchangeSubview)];
    [_loginView addSubview:loginJump];
}

//注册界面
- (void)registerInterface{
    //注册视图
    _registerView = [[UIView alloc]initWithFrame:self.view.frame];
    [_registerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_registerView];
    
    //跳转注册
    UIButton *registerJump = [UIButton setTitle:@"已有账号" color:[UIColor blackColor] frame:CGRectMake(300, 10, 60, 40) addTarget:self action:@selector(exchangeSubview)];
    [_registerView addSubview:registerJump];
    
    
    //名字
    UITextField *nameField = [UITextField setFrame:CGRectMake(80, 100, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"真实姓名"];
    [_registerView addSubview:nameField];
    //个人昵称
    UITextField *nickNameField = [UITextField setFrame:CGRectMake(80, 180, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"个人昵称"];
    [_registerView addSubview:nickNameField];
    
    //手机号码
    UITextField *phoneField = [UITextField setFrame:CGRectMake(80, 220, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"手机号码"];
    phoneField.keyboardType = UIKeyboardTypeNumberPad;
    [_registerView addSubview:phoneField];
    //验证码
    UITextField *VerificationField = [UITextField setFrame:CGRectMake(80, 260, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"验证码"];
    [_registerView addSubview:VerificationField];
    
    //设置密码
    UITextField *pwdField = [UITextField setFrame:CGRectMake(80, 300, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"设置密码"];
    [_registerView addSubview:pwdField];
    
    //确认密码
    UITextField *repwdField = [UITextField setFrame:CGRectMake(80, 350, XM_Width -80-80, 30) borderStyle:UITextBorderStyleRoundedRect placeholder:@"确认密码"];
    [_registerView addSubview:repwdField];
    
    
    
    //立即注册
    UIButton *registerBtn = [UIButton setTitle:@"立即注册" BackgroundColor:[UIColor orangeColor] frame:CGRectMake(80,XM_Height - 80, XM_Width -80-80, 30) addTarget:self action:@selector(registerOperation)];
    [_registerView addSubview:registerBtn];
}

//登录操作
- (void)loginOperation{
/*
登录操作：请求后台服务器，将输入的电话号码与数据对比，数据一致请求成功，否则重新输入
 1、请求数据；
 1）需要AF框架；
 2、返回数据；
 3、解析数据；
 4、输入电话号码和密码，于返回数据做对比，如果一致表示输入正确，可以登录
 */
    
        NSLog(@"请输入您的手机号和密码");

}
//注册操作
- (void)registerOperation{
    XMFunc;
}

//点击返回上一界面
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//翻转界面
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
