//
//  loginRegisterController.m
//  roomRelarion
//
//  Created by Apple on 2017/3/30.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "loginRegisterController.h"

@interface loginRegisterController ()

@end

@implementation loginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    
    
    
    //返回“我的”界面操作
    [self meWithDismiss];
    
    
    
    
}
//返回“我的”界面操作
- (void)meWithDismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
