//
//  mineController.m
//  roomRelarion
//
//  Created by Apple on 2017/3/30.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "mineController.h"
#import "loginRegisterController.h"
#import "mineCell.h"
#import "personalInformationController.h"



@interface mineController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>


@property (nonatomic,strong) NSMutableDictionary *setionDC;
@property (nonatomic,strong) NSArray *firstArr;
@property (nonatomic,strong) NSArray *secondArr;

@end

static NSString *meCellID = @"meCellID";//“我的”模块

@implementation mineController

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    self.navigationItem.title = @"我的";
    
    //去掉系统自带的分割线
    [self removeSeparator];
   
    //隐藏滑动条
    self.tableView.showsVerticalScrollIndicator =NO;
    //设置每组头尾高度
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    //设置tableview的显示高度
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //cell排列所需要的数据
    [self dataDction];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarButtonDidRepeatClick) name:XMTabBarButtonDidRepeatClickNotification object:nil];
    
    //注册cell
    [self.tableView registerClass:[mineCell class] forCellReuseIdentifier:meCellID];

}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//去除系统自带的分割线
- (void)removeSeparator{
    //去掉系统自带的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置tableview的背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
}
//cell排列所需要的数据
- (void)dataDction{
    _firstArr = @[@"登录/注册"];
    _secondArr = @[@"个人信息",@"修改密码",@"财务明细",@"银行账号",@"退出登录"];
    _setionDC = [NSMutableDictionary dictionary];
    [_setionDC setValue:_firstArr forKey:@"firstKey"];
    [_setionDC setValue:_secondArr forKey:@"secondKey"];
}
//重复点击
- (void)tabBarButtonDidRepeatClick{
    if (self.view.window == nil) return;
    XMFunc;
}


#pragma mark - 点击cell跳转界面
//点击cell跳转界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        loginRegisterController *loginVc = [[loginRegisterController alloc]init];
        //隐藏BottomBar
        loginVc.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:loginVc animated:YES];

        
        
        
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
   
        personalInformationController *personalTableVc = [[personalInformationController alloc]init];
        
        personalTableVc.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:personalTableVc animated:YES];
        
    }
    
    

}
#pragma mark - 设置cell组数和行数、宽高
// 创建几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _setionDC.count;
}
//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return _firstArr.count;
    }else {
        return _secondArr.count;
    }
    
    
}
//每组行数的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80;
    }

    return 35;
    
}

//每组头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    mineCell *cell = [[mineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:meCellID];
   
    if (indexPath.section != 1 || indexPath.row != 4) {
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 0) {
        [cell setWithImage:[UIImage imageNamed:@"setup-head-default"] text:_firstArr[indexPath.row]];
    }else{
        [cell setWithImage:nil text:_secondArr[indexPath.row]];
    }
    
    return cell;
}



@end
