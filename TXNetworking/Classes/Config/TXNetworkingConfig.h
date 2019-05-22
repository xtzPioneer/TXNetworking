//
//  TXNetworkingConfig.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/13.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXNetworkingRequestConfig.h"
#import "TXNetworkingDeBugConfig.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  网络配置
 */
@interface TXNetworkingConfig : NSObject <NSCopying,NSMutableCopying>

/**
 *  网络请求配置
 */
@property (nonatomic,strong)TXNetworkingRequestConfig *requestConfig;

/**
 *  DeBug配置
 */
@property (nonatomic,strong)TXNetworkingDeBugConfig *deBugConfig;

/**
 *  快速构建网络配置
 */
+ (instancetype)config;

// 禁止使用下面方法创建对象
- (instancetype)init __attribute__((unavailable("请使用config方法创建对象")));
+ (instancetype)new __attribute__((unavailable("请使用config方法创建对象")));

@end

NS_ASSUME_NONNULL_END
