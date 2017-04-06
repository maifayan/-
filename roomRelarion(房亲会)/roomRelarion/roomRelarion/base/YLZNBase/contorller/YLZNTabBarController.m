//
//  YLZNTabBarController.m
//  roomRelarion
//
//  Created by Apple on 2017/3/29.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "YLZNTabBarController.h"
#import "houseResourceController.h"
#import "clientController.h"
#import "counselorController.h"
#import "mineController.h"
#import "YLZNTabBar.h"
#import "YNavigationController.h"

@interface YLZNTabBarController ()

@end

@implementation YLZNTabBarController

+ (void)load {
    
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    //设置tabbaritem的字体属性
    NSMutableDictionary *attribuD = [NSMutableDictionary dictionary];
    attribuD[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:attribuD forState:UIControlStateNormal];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self setAllContrller];
    
    //设置子控制器的按钮
    [self setAllTitleButton];
    
    //自定义tabBar
    [self setTabbar];
    
    
}

#pragma mark - 添加子控制器
- (void) setAllContrller{
    
    //房源
    houseResourceController *houseResourceVc = [[houseResourceController alloc]init];
    //创建导航栏-->添加根控制器
    YNavigationController *naVc = [[YNavigationController alloc]initWithRootViewController:houseResourceVc];
    
    //添加子控制器
    [self addChildViewController:naVc];
    
    
    //客户
    clientController *clientVc = [[clientController alloc]init];
    //创建导航栏-->添加根控制器
    YNavigationController *naVc1 = [[YNavigationController alloc]initWithRootViewController:clientVc];

    //添加子控制器
    [self addChildViewController:naVc1];
    
    //置业顾问
    counselorController *counselorVc = [[counselorController alloc]init];
    //创建导航栏-->添加根控制器
    YNavigationController *naVc2 = [[YNavigationController alloc]initWithRootViewController:counselorVc];

    //添加子控制器
    [self addChildViewController:naVc2];
    
    //我的

    mineController *mineVc = [[mineController alloc]init];
    //创建导航栏-->添加根控制器
    YNavigationController *naVc3 = [[YNavigationController alloc]initWithRootViewController:mineVc];

    //添加子控制器
    [self addChildViewController:naVc3];
    
    
}

- (void) setAllTitleButton {

    //房源
    UINavigationController *naVc = self.childViewControllers[0];
        naVc.tabBarItem.title = @"房源";

    
    
    //客户
    UINavigationController *naVc1 = self.childViewControllers[1];
        naVc1.tabBarItem.title = @"客户";
    
    
//    //地图
//    
//    UINavigationController *naVc2 = self.childViewControllers[2];
//    naVc2.tabBarItem.title = @"地图";
    

    
    //置业顾问
    UINavigationController *naVc3 = self.childViewControllers[2];
    naVc3.tabBarItem.title = @"置业顾问";
    
    
    //我的
    UINavigationController *naVc4 = self.childViewControllers[3];
        naVc4.tabBarItem.title = @"我的";


}

#pragma mark - Tabbar
- (void) setTabbar {
    
    
    YLZNTabBar *tabBar = [[YLZNTabBar alloc]init];
    [self setValue:tabBar forKey:@"tabBar"];
    
    
}





@end
