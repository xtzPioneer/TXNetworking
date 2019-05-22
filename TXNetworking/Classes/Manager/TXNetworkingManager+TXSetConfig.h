//
//  TXNetworkingManager+TXSetConfig.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  设置配置
 */
@interface TXNetworkingManager (TXSetConfig)

/**
 *  设置配置 (类方法)
 */
+ (void)setConfig:(void(^)(TXNetworkingConfig * _Nonnull config))configHandler;

/**
 *  设置配置 (对象方法)
 */
- (void)setConfig:(void(^)(TXNetworkingConfig * _Nonnull config))configHandler;

@end

NS_ASSUME_NONNULL_END
