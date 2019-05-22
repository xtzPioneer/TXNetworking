//
//  TXNetworkingDeBugConfig.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingDeBugConfig.h"

@implementation TXNetworkingDeBugConfig

/**
 *  快速构建DeBug配置
 */
+ (instancetype)config{
    return [[self alloc] init];
}

/**
 *  重写init方法
 */
- (instancetype)init {
    if (self = [super init]) {
        _defaultDeBug=YES;
    }
    return self;
}

/**
 *  NSCopying 协议 copy
 */
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    TXNetworkingDeBugConfig *config=[[[self class] allocWithZone:zone] init];
    config.defaultDeBug=_defaultDeBug;
    return config;
}

/**
 *  NSCopying 协议 mutableCopy
 */
- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    TXNetworkingDeBugConfig *config=[[[self class] allocWithZone:zone] init];
    config.defaultDeBug=_defaultDeBug;
    return config;
}

@end
