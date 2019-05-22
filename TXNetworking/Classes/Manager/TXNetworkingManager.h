//
//  TXNetworkingManager.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXNetworkingConfig.h"
#import "NSString+TXAdd.h"
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  网络请求管理器
 */
@interface TXNetworkingManager : NSObject

/**
 *  网络配置
 */
@property (nonatomic,strong,readonly)TXNetworkingConfig *config;

/**
 *  网络配置
 */
+ (TXNetworkingConfig * _Nonnull)config;

/**
 *  任务缓存池
 */
@property (nonatomic,strong,readonly)NSMutableDictionary<NSString *, NSURLSessionTask *> *tasks;

/**
 *  线程锁
 */
@property (nonatomic,strong,readonly)NSLock *lock;

/**
 *  创建共享网络管理器
 */
+ (instancetype)manager;

// 禁止使用下面方法创建对象
- (instancetype)init __attribute__((unavailable("请使用manager方法创建对象")));
+ (instancetype)new __attribute__((unavailable("请使用manager方法创建对象")));
- (instancetype)copy __attribute__((unavailable("请使用manager方法创建对象")));
- (instancetype)mutableCopy __attribute__((unavailable("请使用manager方法创建对象")));
+ (instancetype)copy __attribute__((unavailable("请使用manager方法创建对象")));
+ (instancetype)mutableCopy __attribute__((unavailable("请使用manager方法创建对象")));

@end

NS_ASSUME_NONNULL_END
