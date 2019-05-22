//
//  TXNetworkingManager+TXTaskManager.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager+TXTaskManager.h"

@implementation TXNetworkingManager (TXTaskManager)

/**
 *  添加任务(对象方法)
 *
 *  @param task 任务
 *  @param key 键
 */
- (void)addTaskWithTask:(NSURLSessionTask * _Nonnull)task key:(NSString * _Nonnull)key {
    [self.lock lock];
    if(![self isExistsTaskWithKey:key]) self.tasks[key]=task;
    [self.lock unlock];
}

/**
 *  添加任务(类方法)
 *
 *  @param task 任务
 *  @param key 键
 */
+ (void)addTaskWithTask:(NSURLSessionTask * _Nonnull)task key:(NSString * _Nonnull)key {
    [[self manager] addTaskWithTask:task key:key];
}

/**
 *  移除任务(对象方法)
 *
 *  @param key 键
 */
- (void)removeTaskWithKey:(NSString * _Nonnull)key {
    [self.lock lock];
    if([self isExistsTaskWithKey:key]) [self.tasks removeObjectForKey:key];
    [self.lock unlock];
}

/**
 *  移除任务(类方法)
 *
 *  @param key 键
 */
+ (void)removeTaskWithKey:(NSString * _Nonnull)key {
    [[self manager] removeTaskWithKey:key];
}

/**
 *  是否存在该任务(对象方法)
 *
 *  @param key 键
 *
 *  @return BOOL 是否存在该任务
 */
- (BOOL)isExistsTaskWithKey:(NSString * _Nonnull)key {
    return self.tasks[key] ? YES : NO;
}

/**
 *  是否存在该任务(类方法)
 *
 *  @param key 键
 *
 *  @return BOOL 是否存在该任务
 */
+ (BOOL)isExistsTaskWithKey:(NSString * _Nonnull)key {
    return [[self manager] isExistsTaskWithKey:key];
}

/**
 *  取消全部任务
 */
- (void)cancelAllTasks {
    [self.lock lock];
    [self.tasks enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [obj cancel];
    }];
    [self.tasks removeAllObjects];
    [self.lock unlock];
}

/**
 *  取消全部任务
 */
+ (void)cancelAllTasks {
    [[self manager] cancelAllTasks];
}

@end
