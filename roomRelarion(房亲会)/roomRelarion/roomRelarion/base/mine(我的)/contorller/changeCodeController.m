//
//  changeCodeController.m
//  roomRelarion
//
//  Created by Apple on 2017/4/24.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "changeCodeController.h"

@interface changeCodeController ()

@property (nonatomic,strong)NSArray *labelArr;
@end

@implementation changeCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _labelArr =@[@"输入旧密码:",@"设置新密码:",@"确认新密码:"];
    //label
    [self setupLabel];
    //textField
    [self setupTextField];
}

- (void)setupLabel{
    
    for (NSInteger i = 0; i < _labelArr.count; i++) {
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(30, 50 *i +15 +64, 0, 0);
        label.text = _labelArr[i];
        label.font = [UIFont systemFontOfSize:14];
        [label sizeToFit];
        [self.view addSubview:label];
    }
}

- (void)setupTextField{
    for (NSInteger i =0; i < _labelArr.count; i++) {
        UITextField *textField = [[UITextField alloc]init];
        textField.frame= CGRectMake(120, 50 *i +10 + 64
                                    , 200, 30);
        [textField setSecureTextEntry:YES];
        textField.backgroundColor = [UIColor clearColor];

        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.layer.borderColor = [UIColor clearColor].CGColor;
        
        [self.view addSubview:textField];
    }
    
    
}

@end
