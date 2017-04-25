//
//  AppUtil.m
//  roomRelarion
//
//  Created by Apple on 2017/4/18.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "AppUtil.h"

@implementation AppUtil



+ (BOOL)checkTel:(NSString *)mobileNo{
    
    /**
     * 新增手机号码
     * 移动：152,183,184,157,147,178
     * 联通：145,176
     * 电信：181,177
     */
    NSString * NEW = @"^1(4[57]|5[27]|8[134]|7[678])\\d{8}$";
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188  ,152,183,184,157,147,178
     * 联通：130,131,132,152,155,156,185,186 ,152,145,176
     * 电信：133,1349,153,180,189  ,181,177
     */
    
    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT];
    NSPredicate *regextestNew = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",NEW];
    
    if (([regextestmobile evaluateWithObject:mobileNo] == YES)
    ||([regextestcm evaluateWithObject:mobileNo] == YES)
    ||([regextestcu evaluateWithObject:mobileNo] == YES)
    ||([regextestct evaluateWithObject:mobileNo] == YES)
    ||([regextestNew evaluateWithObject:mobileNo])){
        return YES;
    }else{
        return NO;
    }
}
#pragma mark - 把字典转换为data
+ (NSMutableData *)dictionaryTodata:(NSDictionary *)dic{
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:dic forKey:kdateKey];
    [archiver finishEncoding];
    return data;
}

#pragma mark - 写入到keychain
+ (BOOL)writeToKeychain:(NSMutableData *)data{
    NSError *error;
    [SSKeychain setPasswordData:data forService:kService account:@"account" error:&error];
    if (error != nil) {
        return NO;
    }else return YES;
}

#pragma mark - 读取keychain
+ (BOOL)isExistKeychain{
    NSData *data = [SSKeychain passwordDataForService:kService account:@"account"];
    if (data != nil)return YES;
    else return NO;
}

@end
