//
//  bankAccountCell.m
//  roomRelarion
//
//  Created by Apple on 2017/4/24.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "bankAccountCell.h"


@implementation bankAccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setMyModel:(bankAccountModel *)myModel{
    _myModel = myModel;
    _myImageView.image = [UIImage imageNamed:@"icon_ identity"];
    _myTextField.placeholder = _myModel.myText;
}



@end
