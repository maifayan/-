//
//  UIButton+extension.m
//  roomRelarion
//
//  Created by Apple on 2017/4/7.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "UIButton+extension.h"

@implementation UIButton (extension)

+ (UIButton *)setTitle:(NSString *)title color:(UIColor *)color frame:(CGRect)frame addTarget:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setFrame:frame];
    [button setFont:[UIFont systemFontOfSize:14]];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)setTitle:(NSString *)title BackgroundColor:(UIColor *)color frame:(CGRect)frame addTarget:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:color];
    [button setFrame:frame];
    [button setFont:[UIFont systemFontOfSize:14]];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}



@end
