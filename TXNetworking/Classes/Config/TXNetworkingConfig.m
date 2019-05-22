//
//  TXNetworkingConfig.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/13.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingConfig.h"

@implementation TXNetworkingConfig

/**
 *  快速构建网络请求配置
 */
+ (instancetype)config {
    return [[self alloc] init];
}

/**
 *  重写init方法
 */
- (instancetype)init {
    if (self = [super init]) {
        _requestConfig=[TXNetworkingRequestConfig config];
        _deBugConfig=[TXNetworkingDeBugConfig config];
    }
    return self;
}

/**
 *  NSCopying 协议 copy
 */
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    TXNetworkingConfig *config=[[[self class] allocWithZone:zone] init];
    config.requestConfig=[_requestConfig copy];
    config.deBugConfig=[_deBugConfig copy];
    return config;
}

/**
 *  NSCopying 协议 mutableCopy
 */
- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    TXNetworkingConfig *config=[[[self class] allocWithZone:zone] init];
    config.requestConfig=[_requestConfig mutableCopy];
    config.deBugConfig=[_deBugConfig mutableCopy];
    return config;
}

@end
