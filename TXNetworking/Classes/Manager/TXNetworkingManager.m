//
//  TXNetworkingManager.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager.h"

@implementation TXNetworkingManager

/**
 *  创建共享网络管理器
 */
+ (instancetype)manager{
    static TXNetworkingManager *managerInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance=[[self alloc] init];
    });
    return managerInstance;
}

/**
 *  重写init方法
 */
- (instancetype)init {
    if (self = [super init]) {
        // 配置
        _config=[TXNetworkingConfig config];
        // 任务池
        _tasks=[NSMutableDictionary dictionary];
        // 线程锁
        _lock=[[NSLock alloc] init];
    }
    return self;
}

/**
 *  网络配置
 */
+ (TXNetworkingConfig * _Nonnull)config {
    return [[self manager] config];
}

@end
