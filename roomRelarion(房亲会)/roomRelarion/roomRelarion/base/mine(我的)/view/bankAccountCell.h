//
//  bankAccountCell.h
//  roomRelarion
//
//  Created by Apple on 2017/4/24.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bankAccountModel.h"

@interface bankAccountCell : UITableViewCell
@property (strong,nonatomic) bankAccountModel *myModel;

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end
