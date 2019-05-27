//
//  TXNetworkingManager+TXSetDeBugConfig.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  设置DeBug配置
 */
@interface TXNetworkingManager (TXSetDeBugConfig)

/**
 *  设置默认是否DeBug
 */
- (TXNetworkingManager *(^)(BOOL defaultDeBug))setDefaultDeBug;

@end

NS_ASSUME_NONNULL_END
