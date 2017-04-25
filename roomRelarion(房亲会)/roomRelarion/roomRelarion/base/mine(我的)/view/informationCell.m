//
//  informationCell.m
//  roomRelarion
//
//  Created by Apple on 2017/4/1.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "informationCell.h"
#import "informationModel.h"

@interface informationCell ()

@property (strong, nonatomic) UIImageView *imageV;
@property (strong, nonatomic) UITextField *textField;


@end

@implementation informationCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.imageV];
        [self.contentView addSubview:self.textField];
        
        
    }
    
    return self;
}

- (void)setDataString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath{
    self.textField.placeholder = dataString;
    self.textField.indexPath = indexPath;
}

#pragma mark - UIImageView
- (UIImageView *)imageV{
    
    if (!_imageV) {
        
        _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 15, 20, 20)];
        
        _imageV.backgroundColor = [UIColor clearColor];
//        _imageV.image = [UIImage imageNamed:@"icon_ identity"];
        
    }
    
    return _imageV;
}

#pragma mark - textField
- (UITextField *)textField{

    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(60, 7, XM_Width - 60 -60, 35)];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.layer.cornerRadius = 9;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.layer.borderColor = [UIColor clearColor].CGColor;
        _textField.layer.borderWidth = 0;
        
    }
    
    return _textField;
}







- (void)setWithImage:(UIImage *)image text:(NSString *)text{
    if (image != nil) {
        self.imageView.image = image;
    }
    
    self.textLabel.text = text;
}
//分割线
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

@end
