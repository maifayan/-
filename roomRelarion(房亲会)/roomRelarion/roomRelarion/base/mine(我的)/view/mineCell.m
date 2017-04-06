//
//  mineCell.m
//  roomRelarion
//
//  Created by Apple on 2017/3/31.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "mineCell.h"

@implementation mineCell

-(void)setFrame:(CGRect)frame{
    
    
    frame.size.height -= 1;
    
    [super setFrame:frame];
}



-(void)layoutSubviews{

    [super layoutSubviews];
    
    // 初始化数据
    CGFloat w = self.frame.size.width;
    CGFloat h = 1;
    CGFloat x = 0;
    CGFloat y = self.frame.size.height - 1;
    // 添加自定义分隔线
    UIView *sepLine = [[UIView alloc] init];
    
    sepLine.frame = CGRectMake(x, y, w, h);
    
    // 设置背景色
    sepLine.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1];
    
    [self.contentView addSubview:sepLine];

}

- (void)setWithImage:(UIImage *)image text:(NSString *)text{
    if (image != nil) {
    self.imageView.image = image;
    }
    
    self.textLabel.text = text;
}





@end
