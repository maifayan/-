//
//  UITextField+IndexPath.m
//  roomRelarion
//
//  Created by Apple on 2017/4/5.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "UITextField+IndexPath.h"
#import <objc/runtime.h>
@implementation UITextField (IndexPath)
static char indexPathKey;
- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, &indexPathKey);
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (UITextField *)setFrame:(CGRect)frame borderStyle:(UITextBorderStyle)borderStyle placeholder:(NSString *)placeholder
{
    UITextField *textField =[[UITextField alloc]initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = placeholder;
    textField.font = [UIFont systemFontOfSize:14];
    textField.textColor = [UIColor blackColor];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}


@end
