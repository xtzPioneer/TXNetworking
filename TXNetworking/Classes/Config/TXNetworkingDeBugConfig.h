//
//  TXNetworkingDeBugConfig.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  DeBug配置
 */
@interface TXNetworkingDeBugConfig : NSObject <NSCopying,NSMutableCopying>

/**
 *  默认是否DeBug
 */
@property (nonatomic,assign)BOOL defaultDeBug;

/**
 *  快速构建DeBug配置
 */
+ (instancetype)config;

// 禁止使用下面方法创建对象
- (instancetype)init __attribute__((unavailable("请使用config方法创建对象")));
+ (instancetype)new __attribute__((unavailable("请使用config方法创建对象")));

@end

NS_ASSUME_NONNULL_END
