//
//  TXNetworkingManager+TXSetDeBugConfig.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager+TXSetDeBugConfig.h"

@implementation TXNetworkingManager (TXSetDeBugConfig)

/**
 *  设置默认是否DeBug
 */
- (TXNetworkingManager *(^)(BOOL defaultDeBug))setDefaultDeBug {
    return ^TXNetworkingManager * (BOOL defaultDeBug) {
        self.config.deBugConfig.defaultDeBug=defaultDeBug;
        return self;
    };
}

@end
