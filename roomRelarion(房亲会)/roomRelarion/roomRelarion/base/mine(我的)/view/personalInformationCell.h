//
//  personalInformationCell.h
//  roomRelarion
//
//  Created by Apple on 2017/3/31.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class callNameModel;
@interface personalInformationCell : UITableViewCell


@property (nonatomic,strong) UILabel *nameLabel;

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *welcomeLabel;

+(instancetype)cellWithTableView:(UITableView *)tableView mineModel:(callNameModel*)mineModel;

@end
