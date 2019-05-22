//
//  TXNetworkingManager+TXSetConfig.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager+TXSetConfig.h"

@implementation TXNetworkingManager (TXSetConfig)

/**
 *  设置配置 (类方法)
 */
+ (void)setConfig:(void(^)(TXNetworkingConfig * _Nonnull config))configHandler {
    [[self manager] setConfig:configHandler];
}

/**
 *  设置配置 (对象方法)
 */
- (void)setConfig:(void(^)(TXNetworkingConfig * _Nonnull config))configHandler {
    if (configHandler) configHandler (self.config);
}

@end
