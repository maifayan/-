//
//  UITextField+IndexPath.m
//  roomRelarion
//
//  Created by Apple on 2017/4/5.
//  Copyright © 2017年 YaLeZhiNeng. All rights reserved.
//

#import "UITextField+IndexPath.h"
#import <objc/runtime.h>
@implementation UITextField (IndexPath)
static char indexPathKey;
- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, &indexPathKey);
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



@end
