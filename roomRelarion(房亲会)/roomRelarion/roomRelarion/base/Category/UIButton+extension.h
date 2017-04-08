//
//  UIButton+extension.h
//  roomRelarion
//
//  Created by Apple on 2017/4/7.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (extension)

+ (UIButton *)setTitle:(NSString *)title color:(UIColor *)color frame:(CGRect)frame addTarget:(id)target action:(SEL)action;

+ (UIButton *)setTitle:(NSString *)title BackgroundColor:(UIColor *)color frame:(CGRect)frame addTarget:(id)target action:(SEL)action;


@end
