//
//  TXNetworkingManager+TXTaskRequest.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager.h"
#import "TXTaskRequest.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  管理任务请求
 */
@interface TXNetworkingManager (TXTaskRequest)

/**
 *  开始任务请求(对象方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
- (TXTaskRequest * _Nonnull)startTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request;

/**
 *  开始任务请求(类方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
+ (TXTaskRequest * _Nonnull)startTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request;

/**
 *  取消任务请求(对象方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
- (TXTaskRequest * _Nonnull)cancelTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request;

/**
 *  取消任务请求(类方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
+ (TXTaskRequest * _Nonnull)cancelTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request;

/**
 *  继续任务请求(对象方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
- (TXTaskRequest * _Nonnull)resumeTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request;

/**
 *  继续任务请求(类方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
+ (TXTaskRequest * _Nonnull)resumeTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request;

/**
 *  暂停任务请求(对象方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
- (TXTaskRequest * _Nonnull)pauseTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request;

/**
 *  暂停任务请求(类方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
+ (TXTaskRequest * _Nonnull)pauseTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request;

@end

NS_ASSUME_NONNULL_END
