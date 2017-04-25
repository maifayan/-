//
//  bankAccountController.m
//  roomRelarion
//
//  Created by Apple on 2017/4/24.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "bankAccountController.h"
#import "bankAccountCell.h"
#import "bankAccountModel.h"

static NSString *bankAccountID = @"bankAccountID";
@interface bankAccountController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_textData;
}
@property (nonatomic,strong) NSArray *placeholderArray;

@end

@implementation bankAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _placeholderArray = @[@"开户行",@"姓名",@"身份证号",@"银行卡号",@"验证码"];
    _textData = [NSMutableArray array];
    for (NSInteger i = 0; i<_placeholderArray.count; i++) {
        bankAccountModel *textModel = [[bankAccountModel alloc]init];
        textModel.myText = _placeholderArray[i];
        // 把每一个 model 存放到可变数组中
        [_textData addObject:textModel];
    }
    

    //列表
    [self setupTable];
    
    
    
    
}

- (void)setupTable{
    UITableView *tableV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    tableV.delegate = self;
    tableV.dataSource = self;
    tableV.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    tableV.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
        //去掉ios7的separatorInset边距
    tableV.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //注册
    [tableV registerNib:[UINib nibWithNibName:@"bankAccountCell" bundle:nil] forCellReuseIdentifier:bankAccountID];
    
    [self.view addSubview:tableV];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.placeholderArray.count;
}
//每组尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   bankAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:bankAccountID forIndexPath:indexPath];
    cell.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
   
    
    cell.myModel = _textData[indexPath.row];
    cell.contentView.backgroundColor = [UIColor clearColor];

    
    
    return cell;
}

@end
