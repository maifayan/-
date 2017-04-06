//
//  informationCell.m
//  roomRelarion
//
//  Created by Apple on 2017/4/1.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "informationCell.h"
#import "UITextField+IndexPath.h"
@interface informationCell ()

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation informationCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.textField];
        [self.contentView addSubview:self.titleLabel];
    }
    
    return self;
}

- (void)setTitleString:(NSString *)string andDataString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath{
    self.textField.text =dataString;
    self.titleLabel.text = string;
    self.textField.indexPath = indexPath;
}

- (UITextField *)textField{

    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(120, 5, 160, 30)];
        
        _textField.layer.borderColor = [UIColor cyanColor].CGColor;
        _textField.layer.borderWidth = 0.5;
        
    }
    
    return _textField;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 40)];
    }
    return _titleLabel;
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
