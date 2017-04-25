//
//  personalInformationController.m
//  roomRelarion
//
//  Created by Apple on 2017/3/31.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "personalInformationController.h"
#import "personalInformationCell.h"
#import "informationCell.h"
#import "UITextField+IndexPath.h"
#import "callNameModel.h"
#import "informationModel.h"

@interface personalInformationController ()

@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSMutableArray *arrayDataSouce;

@end



static NSString *infoCellID = @"infoCell";
@implementation personalInformationController

#pragma mark - 添加字典和数组
- (NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"姓名",@"性别",@"昵称",@"籍贯",@"身份证号",@"手机号码",@"通讯地址"];
    
    }
    return _titleArr;
}


- (NSMutableArray *)arrayDataSouce{
    if (!_arrayDataSouce) {
        _arrayDataSouce = [NSMutableArray array];
        [_arrayDataSouce addObject:@""];
        [_arrayDataSouce addObject:@""];
        [_arrayDataSouce addObject:@""];
        [_arrayDataSouce addObject:@""];
        [_arrayDataSouce addObject:@""];
        [_arrayDataSouce addObject:@""];
        [_arrayDataSouce addObject:@""];
    }
    return _arrayDataSouce;
}




#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加导航栏右边按钮

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(clickRefresh)];
    
    self.navigationItem.title = @"个人信息";
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    
    
    self.tableView.showsVerticalScrollIndicator = YES;
    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //通知填写信息
    [self setNotification];
    
    //手势
    [self tapGestureRecognizer];
    

    //注册information cell
    [self.tableView registerClass:[informationCell class] forCellReuseIdentifier:infoCellID];
    
}
#pragma mark - 手势
- (void)tapGestureRecognizer{
    UITapGestureRecognizer *gestur = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenKeyBord)];
    [self.tableView addGestureRecognizer:gestur];
}
- (void)hiddenKeyBord{
    NSLog(@"要隐藏键盘");
    [self.view endEditing:YES];
}

#pragma mark -通知填写信息
- (void)setNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChanged:) name:@"UITextFieldTextDidChangeNotification" object:nil];
}
- (void)textFieldDidChanged:(NSNotification *)nio{
    
    UITextField *textField = nio.object;
    NSIndexPath *indexPath = textField.indexPath;
    [self.arrayDataSouce replaceObjectAtIndex:indexPath.row withObject:textField.text];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)clickRefresh{
    [self.arrayDataSouce enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string =(NSString *)obj;
        if (string.length == 0) {
            NSLog(@"第%lu个位置元素为空",(unsigned long)idx);
            
        }else {
            NSLog(@"%@",obj);
        }
        
    }];
}

#pragma mark - 设置cell组数和行数、宽高
// 创建几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }    
    return self.titleArr.count;
}
//每组行数的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80;
    }
    
    return 50;
    
}

//每组尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {

        callNameModel *callModel = [[callNameModel alloc]init];
        callModel.callName = @"昵称";
        callModel.imageName = @"setup-head-default";
        personalInformationCell *headcell = [personalInformationCell cellWithTableView:tableView mineModel:callModel];
        return headcell;
        
    }else{
        informationCell * infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellID forIndexPath:indexPath];
        
            [infoCell setDataString:self.titleArr[indexPath.row] andIndexPath:indexPath];
        
        return infoCell;
        
    }
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    NSLog(@"要隐藏键盘了.......22222222222");
}


@end
