//
//  WXApiManager.m
//  天下农商渠道版
//
//  Created by 刘京涛 on 2017/7/14.
//  Copyright © 2017年 Sl. All rights reserved.
//

#import "WXApiManager.h"


@implementation WXApiManager
+ (void)registerApp{
    //注册微信
#ifdef WECHAT_UPDATE
    [WXApi registerApp:WXAPPID universalLink:WXAPPLINK];
#else
    [WXApi registerApp:WXAPPID];
#endif
}
#pragma mark - LifeCycle
+(instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static WXApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[WXApiManager alloc] init];
    });
    return instance;
}

@end
