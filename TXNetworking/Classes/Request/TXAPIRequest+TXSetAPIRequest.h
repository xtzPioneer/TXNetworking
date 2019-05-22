//
//  TXAPIRequest+TXSetAPIRequest.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/15.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXAPIRequest.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  设置API请求
 */
@interface TXAPIRequest (TXSetAPIRequest)

/**
 *  设置请求类型
 */
- (TXAPIRequest *(^)(TXAPIRequestMethodType method))setMethod;

/**
 *  设置请求的URL
 */
- (TXAPIRequest *(^)(NSString * _Nonnull))setURL;

/**
 *  设置请求的baseURL
 */
- (TXAPIRequest *(^)(NSString * _Nullable))setBaseURL;

/**
 *  设置请求的超时间隔
 */
- (TXAPIRequest *(^)(NSTimeInterval timeoutInterval))setTimeoutInterval;

/**
 *  设置请求头(会覆盖之前的请求头)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))setHeaders;

/**
 *  添加请求头(不会覆盖之前的请求头)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))addHeaders;

/**
 *  设置请求的参数(会覆盖之前的参数)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))setParameters;

/**
 *  添加请求参数(不会覆盖之前的参数)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))addParameters;

/**
 *  设置请求的默认内容类型(会覆盖之前的内容类型)
 */
- (TXAPIRequest *(^)(NSSet<NSString *> *contentTypes))setContentTypes;

/**
 *  添加请求的默认内容类型(不会覆盖之前的内容类型)
 */
- (TXAPIRequest *(^)(NSSet<NSString *> *contentTypes))addContentTypes;

/**
 *  设置请求的结果回调
 */
- (TXAPIRequest *(^)(TXSuccessHandler _Nullable))setSuccessHandler;

/**
 *  设置请求的失败回调
 */
- (TXAPIRequest *(^)(TXFailureHandler _Nullable))setFailureHandler;

/**
 *  设置请求的进度回调
 */
- (TXAPIRequest *(^)(TXProgressHandler _Nullable))setProgressHandler;

/**
 *  设置成功格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setSuccessFormatHandler;

/**
 *  设置失败格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setFailureFormatHandler;

/**
 *  设置进度格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setProgressFormatHandler;

/**
 *  设置API请求状态回调
 */
- (TXAPIRequest *(^)(TXAPIRequestStateHandler _Nullable))setStateHandler;

/**
 *  设置是否DeBug
 */
- (TXAPIRequest *(^)(BOOL deBug))setDeBug;

/**
 *  设置DeBug回调
 */
- (TXAPIRequest *(^)(TXDeBugHandler _Nullable))setDeBugHandler;

/**
 *  开始请求
 */
- (TXAPIRequest *(^)(void))start;

/**
 *  取消请求
 */
- (TXAPIRequest *(^)(void))cancel;

@end

NS_ASSUME_NONNULL_END
