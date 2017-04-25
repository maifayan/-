//
//  AppDelegate.m
//  roomRelarion
//
//  Created by Apple on 2017/3/29.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "AppDelegate.h"

#import "YLZNTabBarController.h"
#import <EaseMobSDKFull/EaseMob.h>
#import <SVProgressHUD.h>
#import <WXApi.h>

#define XM_appKey  @"wxf6d1257baa0d417f"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    if (![WXApi isWXAppInstalled]) {
//        NSLog(@"请先安装微信");
//    } ;
//    
//        [WXApi registerApp:XM_appKey];//微信开发平台注册应用程序
    
    
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    YLZNTabBarController *YTabVc = [[YLZNTabBarController alloc]init];
    self.window.rootViewController = YTabVc;
    
    [self.window makeKeyAndVisible];
    
    
    [[EaseMob sharedInstance] registerSDKWithAppKey:XM_appKey
                                       apnsCertName:nil
                                        otherConfig:@{kSDKConfigEnableConsoleLogger: @NO}];
    
    [[EaseMob sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}
//用户授权之后回调本应用 直接调用方法像微信请求access_token
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [WXApi handleOpenURL:url delegate:self];
}

- (void)onReq:(BaseReq *)req{
    
    if ([req isKindOfClass:[GetMessageFromWXReq class]]) {
        
        NSString *strTitle = [NSString stringWithFormat:@"微信请求App提供内容"];
        NSString *strMsg = @"微信请求App提供内容，App要调用sendResp:GetMessageFromWXResp返回给微信";
         [UIAlertController alertControllerWithTitle:strTitle message:strMsg preferredStyle:UIAlertControllerStyleActionSheet];
        
       
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        WXMediaMessage *msg = temp.message;
        
        //显示微信传过来的内容
        WXAppExtendObject *obj = msg.mediaObject;
        
        NSString *strTitle = [NSString stringWithFormat:@"微信请求App显示内容"];
        NSString *strMsg = [NSString stringWithFormat:@"标题：%@ \n内容：%@ \n附带信息：%@ \n缩略图:%lu bytes\n\n", msg.title, msg.description, obj.extInfo,   (unsigned long)msg.thumbData.length];
        
        [UIAlertController alertControllerWithTitle:strTitle message:strMsg preferredStyle:UIAlertControllerStyleActionSheet];
        
    }
    else if([req isKindOfClass:[LaunchFromWXReq class]])
    {
        //从微信启动App
        NSString *strTitle = [NSString stringWithFormat:@"从微信启动"];
        NSString *strMsg = @"这是从微信启动的消息";
        
        [UIAlertController alertControllerWithTitle:strTitle message:strMsg preferredStyle:UIAlertControllerStyleActionSheet];
    
    }

}

- (void)onResp:(BaseResp *)resp{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"发送媒体消息结果"];
        NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
        
        [UIAlertController alertControllerWithTitle:strTitle message:strMsg preferredStyle:UIAlertControllerStyleActionSheet];        
    }
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[EaseMob sharedInstance]applicationWillTerminate:application];
}


@end
