//
//  YNavigationController.m
//  roomRelarion
//
//  Created by Apple on 2017/3/31.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "YNavigationController.h"
#import "UIBarButtonItem+Item.h"
@interface YNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation YNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    
    [self.view addGestureRecognizer:pan];
    // 控制手势什么时候触发,只有非根控制器才需要触发手势
    pan.delegate = self;
    //禁止之前手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

#pragma mark - UIGestureRecognizerDelegate
//决定是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {//非根控制器

        viewController.hidesBottomBarWhenPushed = YES;

        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];

    }
    //真正的跳转
    [super pushViewController:viewController animated:animated];
}

- (void)back{

    [self popViewControllerAnimated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
