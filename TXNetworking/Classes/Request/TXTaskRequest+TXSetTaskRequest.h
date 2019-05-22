//
//  TXTaskRequest+TXSetTaskRequest.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXTaskRequest.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  设置任务请求
 */
@interface TXTaskRequest (TXSetTaskRequest)

/**
 *  设置请求类型
 */
- (TXTaskRequest *(^)(TXTaskRequestMethodType method))setMethod;

/**
 *  设置请求的URL
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setURL;

/**
 *  设置请求的baseURL
 */
- (TXTaskRequest *(^)(NSString * _Nullable))setBaseURL;

/**
 *  设置请求的超时间隔
 */
- (TXTaskRequest *(^)(NSTimeInterval timeoutInterval))setTimeoutInterval;

/**
 *  设置请求头(会覆盖之前的请求头)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))setHeaders;

/**
 *  添加请求头(不会覆盖之前的请求头)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))addHeaders;

/**
 *  设置请求的参数(会覆盖之前的参数)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))setParameters;

/**
 *  添加请求参数(不会覆盖之前的参数)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))addParameters;

/**
 *  设置请求的默认内容类型(会覆盖之前的内容类型)
 */
- (TXTaskRequest *(^)(NSSet<NSString *> *contentTypes))setContentTypes;

/**
 *  添加请求的默认内容类型(不会覆盖之前的内容类型)
 */
- (TXTaskRequest *(^)(NSSet<NSString *> *contentTypes))addContentTypes;

/**
 *  设置请求的结果回调
 */
- (TXTaskRequest *(^)(TXSuccessHandler _Nullable))setSuccessHandler;

/**
 *  设置请求的失败回调
 */
- (TXTaskRequest *(^)(TXFailureHandler _Nullable))setFailureHandler;

/**
 *  设置请求的进度回调
 */
- (TXTaskRequest *(^)(TXProgressHandler _Nullable))setProgressHandler;

/**
 *  设置成功格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setSuccessFormatHandler;

/**
 *  设置失败格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setFailureFormatHandler;

/**
 *  设置进度格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setProgressFormatHandler;

/**
 *  设置FormData回调
 */
- (TXTaskRequest *(^)(TXAFMultipartFormDataHandler _Nullable))setMultipartFormDataHandler;

/**
 *  设置下载文件存储路径
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setDownloadFilePath;

/**
 *  设置下载文件的名字
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setDownloadFileName;

/**
 *  设置任务请求状态回调
 */
- (TXTaskRequest *(^)(TXTaskRequestStateHandler _Nullable))setStateHandler;

/**
 *  设置是否DeBug
 */
- (TXTaskRequest *(^)(BOOL deBug))setDeBug;

/**
 *  设置DeBug回调
 */
- (TXTaskRequest *(^)(TXDeBugHandler _Nullable))setDeBugHandler;

/**
 *  开始请求
 */
- (TXTaskRequest *(^)(void))start;

/**
 *  取消请求
 */
- (TXTaskRequest *(^)(void))cancel;

/**
 *  继续请求
 */
- (TXTaskRequest *(^)(void))resume;

/**
 *  暂停请求
 */
- (TXTaskRequest *(^)(void))pause;

@end

NS_ASSUME_NONNULL_END
