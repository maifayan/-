//
//  AppUtil.h
//  roomRelarion
//
//  Created by Apple on 2017/4/18.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtil : NSObject
+ (BOOL)checkTel:(NSString *)mobileNo;
+ (BOOL)writeToKeychain:(NSMutableData *)data;
+ (BOOL)isExistKeychain;
+ (NSMutableData *)dictionaryTodata:(NSDictionary *)dic;
@end
