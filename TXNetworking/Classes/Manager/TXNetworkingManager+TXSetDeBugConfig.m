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
 *  设置是否DeBug
 */
- (TXNetworkingManager *(^)(BOOL deBug))setDeBug{
    return ^TXNetworkingManager * (BOOL deBug) {
        self.config.deBugConfig.defaultDeBug=deBug;
        return self;
    };
}

@end
