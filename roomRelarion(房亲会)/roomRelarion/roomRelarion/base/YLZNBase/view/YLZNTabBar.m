//
//  YLZNTabBar.m
//  test
//
//  Created by Apple on 2017/3/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YLZNTabBar.h"


///** TabBarButton被重复点击的通知 */
//NSString  * const XMTabBarButtonDidRepeatClickNotification = @"XMTabBarButtonDidRepeatClickNotification";

@interface YLZNTabBar ()

@property (nonatomic,weak) UIControl *previousClickedTabBarButton;

@end

@implementation YLZNTabBar



//按钮布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //跳转UITabBarButton位置
    NSInteger count = self.items.count;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.xm_width / count;
    CGFloat btnH = self.xm_height;
    
    
    
    NSInteger index = 0;
    for (UIControl *tabBarButton in self.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            //设置previousClickedTabBarButton默认为最前面的值
            if (index == 0 && self.previousClickedTabBarButton == nil) {
                self.previousClickedTabBarButton = tabBarButton;
            }
            btnX =btnW * index;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            index++;
            
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    
    }
    
}
//tabBarButton的点击
- (void)tabBarButtonClick:(UIControl *)tabBarButton{
    if (self.previousClickedTabBarButton == tabBarButton) {
        //发出通知，告知外界tabBarButton被重复点击了
        
        [[NSNotificationCenter defaultCenter]postNotificationName:XMTabBarButtonDidRepeatClickNotification object:nil];
    }
    self.previousClickedTabBarButton = tabBarButton;
}



@end
