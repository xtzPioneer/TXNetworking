//
//  TXNetworkingManager+TXAPIRequest.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/15.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager.h"
#import "TXAPIRequest.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  管理API请求
 */
@interface TXNetworkingManager (TXAPIRequest)

/**
 *  开始API请求(对象方法)
 *
 *  @param request API请求
 *
 *  @return TXAPIRequest API请求
 */
- (TXAPIRequest * _Nonnull)startAPIRequest:(TXAPIRequest * _Nonnull)request;

/**
 *  开始API请求(类方法)
 *
 *  @param request API请求
 *
 *  @return TXAPIRequest API请求
 */
+ (TXAPIRequest * _Nonnull)startAPIRequest:(TXAPIRequest * _Nonnull)request;

/**
 *  取消API请求(对象方法)
 *
 *  @param request API请求
 *
 *  @return TXAPIRequest API请求
 */
- (TXAPIRequest * _Nonnull)cancelAPIRequest:(TXAPIRequest * _Nonnull)request;

/**
 *  取消API请求(类方法)
 *
 *  @param request API请求
 *
 *  @return TXAPIRequest API请求
 */
+ (TXAPIRequest * _Nonnull)cancelAPIRequest:(TXAPIRequest * _Nonnull)request;

@end

NS_ASSUME_NONNULL_END
