//
//  TXNetworkingManager+TXTaskManager.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  任务管理
 */
@interface TXNetworkingManager (TXTaskManager)

/**
 *  添加任务(对象方法)
 *
 *  @param task 任务
 *  @param key 键
 */
- (void)addTaskWithTask:(NSURLSessionTask * _Nonnull)task key:(NSString * _Nonnull)key;

/**
 *  添加任务(类方法)
 *
 *  @param task 任务
 *  @param key 键
 */
+ (void)addTaskWithTask:(NSURLSessionTask * _Nonnull)task key:(NSString * _Nonnull)key;

/**
 *  移除任务(对象方法)
 *
 *  @param key 键
 */
- (void)removeTaskWithKey:(NSString * _Nonnull)key;

/**
 *  移除任务(类方法)
 *
 *  @param key 键
 */
+ (void)removeTaskWithKey:(NSString * _Nonnull)key;

/**
 *  是否存在该任务(对象方法)
 *
 *  @param key 键
 *
 *  @return BOOL 是否存在该任务
 */
- (BOOL)isExistsTaskWithKey:(NSString * _Nonnull)key;

/**
 *  是否存在该任务(类方法)
 *
 *  @param key 键
 *
 *  @return BOOL 是否存在该任务
 */
+ (BOOL)isExistsTaskWithKey:(NSString * _Nonnull)key;

/**
 *  取消全部任务
 */
- (void)cancelAllTasks;

/**
 *  取消全部任务
 */
+ (void)cancelAllTasks;

@end

NS_ASSUME_NONNULL_END
