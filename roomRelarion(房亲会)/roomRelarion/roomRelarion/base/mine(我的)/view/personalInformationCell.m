//
//  personalInformationCell.m
//  roomRelarion
//
//  Created by Apple on 2017/3/31.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "personalInformationCell.h"
#import "callNameModel.h"

@implementation personalInformationCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //布局cell内部控件
        [self setupUI];
    }
    
    return self;
}


- (void)setupUI{
    //图片
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    _imageV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_imageV];
    //称呼
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 80, 20)];
    _nameLabel.backgroundColor = [UIColor clearColor];
//    [_nameLabel sizeToFit];
    [_nameLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:_nameLabel];
    //欢迎词
    _welcomeLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 45, 80, 20)];
    _welcomeLabel.backgroundColor = [UIColor clearColor];
    _welcomeLabel.text = @"欢迎来到房亲会！";
    [_welcomeLabel sizeToFit];
    [_welcomeLabel setFont:[UIFont systemFontOfSize:13]];
    [self.contentView addSubview:_welcomeLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView mineModel:(callNameModel*)mineModel{
    static NSString *personCell = @"personCell";
    personalInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:personCell];
    if (cell == nil) {
        cell = [[personalInformationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personCell];
    }
    NSString *imageStr = [NSString stringWithFormat:@"%@", mineModel.imageName];
    cell.imageV.image = [UIImage imageNamed:imageStr];
    cell.nameLabel.text = mineModel.callName;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
    
}



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
