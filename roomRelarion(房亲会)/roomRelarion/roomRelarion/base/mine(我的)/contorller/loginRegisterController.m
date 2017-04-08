//
//  loginRegisterController.m
//  roomRelarion
//
//  Created by Apple on 2017/4/7.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "loginRegisterController.h"
#import "UIButton+extension.h"
//#import "custom.h"
@interface loginRegisterController ()

@end

@implementation loginRegisterController

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //登录视图
    UIView *loginView = [[UIView alloc]initWithFrame:self.view.frame];
    [loginView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:loginView];
    
    //注册视图
    UIView *registerView = [[UIView alloc]initWithFrame:self.view.frame];
    [registerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:registerView];
    
    
    //手机输入框
    UITextField *phoneField = [[UITextField alloc]initWithFrame:CGRectMake(80, 150, 200, 50)];
    phoneField.backgroundColor = [UIColor whiteColor];
    phoneField.placeholder = @"请输入手机号";
    [phoneField sizeToFit];
    [registerView addSubview:phoneField];
    //秘密输入框
    UITextField *pwdField = [[UITextField alloc]initWithFrame:CGRectMake(80, 200, 200, 50)];
    pwdField.backgroundColor = [UIColor whiteColor];
    pwdField.placeholder = @"请输入密码";
    [pwdField sizeToFit];
    [registerView addSubview:pwdField];
    
    UIButton *loginBt = [UIButton setTitle:@"立即登录" color:[UIColor blackColor] frame:CGRectMake(80, 250, 200, 50) addTarget:self action:@selector(loginSystem)];
    
    
    
    //跳转登录按钮
    UIButton *login = [UIButton setTitle:@"登录" color:[UIColor blackColor] frame:CGRectMake(300, 10, 60, 40) addTarget:self action:@selector(exchangeSubview)];
    [registerView addSubview:login];
    
    //跳转注册按钮
    UIButton *re = [UIButton setTitle:@"注册" color:[UIColor blackColor] frame:CGRectMake(300, 10, 60, 40) addTarget:self action:@selector(exchangeSubview)];
    [loginView addSubview:re];
    
    
    
    //返回按钮
    UIButton *backButton = [UIButton setTitle:@"取消" color:[UIColor blackColor] frame:CGRectMake(10, 10, 60, 40) addTarget:self action:@selector(backClick)];
    [self.view addSubview:backButton];
}
//登录系统
- (void)loginSystem{
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
    [UIView commitAnimations];
    
}


@end
