//
//  UIView+frame.m
//  roomRelarion
//
//  Created by Apple on 2017/3/31.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)

- (void)setXm_x:(CGFloat)xm_x{
    
    CGRect rect = self.frame;
    rect.origin.x = xm_x;
    self.frame = rect;
    
}
-(CGFloat)xm_x{
    return self.frame.origin.x;
}

- (void)setXm_y:(CGFloat)xm_y{
    CGRect rect = self.frame;
    rect.origin.y = xm_y;
    self.frame = rect;

}
-(CGFloat)xm_y{
    return self.frame.origin.y;
}

-(void)setXm_width:(CGFloat)xm_width{
    CGRect rect = self.frame;
    rect.size.width = xm_width;
    self.frame = rect;
}

- (CGFloat)xm_width{
    return self.frame.size.width;
}
-(void)setXm_height:(CGFloat)xm_height{
    CGRect rect = self.frame;
    rect.size.height = xm_height;
    self.frame = rect;
}

- (CGFloat)xm_height{
    return self.frame.size.height;
}

-(void)setXm_centerX:(CGFloat)xm_centerX {
    CGPoint center = self.center;
    center.x = xm_centerX;
    self.center = center;
}
-(CGFloat)xm_centerX {
    return self.center.x;
}

-(void)setXm_centerY:(CGFloat)xm_centerY {
    CGPoint center = self.center;
    center.y = xm_centerY;
    self.center = center;
}
-(CGFloat)xm_centerY {
    return self.center.y;
}

@end
