//
//  TXNetworkingManager+TXSetRequestConfig.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  设置网络请求配置
 */
@interface TXNetworkingManager (TXSetRequestConfig)

/**
 *  设置默认请求的baseURL
 */
- (TXNetworkingManager *(^)(NSString * _Nullable))setDefaultBaseURL;

/**
 *  设置默认API请求超时时间
 */
- (TXNetworkingManager *(^)(NSTimeInterval defaultAPIRequestTimeoutInterval))setDefaultAPIRequestTimeoutInterval;

/**
 *  设置默认Task请求超时时间
 */
- (TXNetworkingManager *(^)(NSTimeInterval defaultTaskRequestTimeoutInterval))setDefaultTaskRequestTimeoutInterval;

/**
 *  设置默认请求头(会覆盖之前的请求头)
 */
- (TXNetworkingManager *(^)(NSDictionary<NSString *, NSString*> * _Nonnull))setDefaultHeaders;

/**
 *  添加默认请求头(不会覆盖之前的请求头)
 */
- (TXNetworkingManager *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))addDefaultHeaders;

/**
 *  设置默认请求参数(会覆盖之前的参数)
 */
- (TXNetworkingManager *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))setDefaultParameters;

/**
 *  添加默认请求参数(不会覆盖之前的参数)
 */
- (TXNetworkingManager *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))addDefaultParameters;

/**
 *  设置默认内容类型(会覆盖之前的内容类型)
 */
- (TXNetworkingManager *(^)(NSSet<NSString *> *defaultContentTypes))setDefaultContentTypes;

/**
 *  添加默认内容类型(不会覆盖之前的内容类型)
 */
- (TXNetworkingManager *(^)(NSSet<NSString *> *defaultContentTypes))addDefaultContentTypes;

/**
 *  设置默认的下载文件存储路径
 */
- (TXNetworkingManager *(^)(NSString * _Nullable))setDefaultDownloadFilePath;

/**
 *  设置默认成功格式回调
 */
- (TXNetworkingManager *(^)(TXFormatHandler _Nullable))setDefaultSuccessFormatHandler;

/**
 *  设置默认失败格式回调
 */
- (TXNetworkingManager *(^)(TXFormatHandler _Nullable))setDefaultFailureFormatHandler;

/**
 *  设置默认进度格式回调
 */
- (TXNetworkingManager *(^)(TXFormatHandler _Nullable))setDefaultProgressFormatHandler;

@end

NS_ASSUME_NONNULL_END
