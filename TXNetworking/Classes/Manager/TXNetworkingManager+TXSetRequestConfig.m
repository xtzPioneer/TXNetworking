//
//  TXNetworkingManager+TXSetRequestConfig.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager+TXSetRequestConfig.h"

@implementation TXNetworkingManager (TXSetRequestConfig)

/**
 *  设置默认请求的baseURL
 */
- (TXNetworkingManager *(^)(NSString * _Nullable))setDefaultBaseURL {
    return ^TXNetworkingManager * (NSString * _Nonnull defaultBaseURL) {
        self.config.requestConfig.defaultBaseURL=defaultBaseURL;
        return self;
    };
}

/**
 *  设置默认API请求超时时间
 */
- (TXNetworkingManager *(^)(NSTimeInterval defaultAPIRequestTimeoutInterval))setDefaultAPIRequestTimeoutInterval{
    return ^TXNetworkingManager * (NSTimeInterval defaultAPIRequestTimeoutInterval) {
        self.config.requestConfig.defaultAPIRequestTimeoutInterval=defaultAPIRequestTimeoutInterval;
        return self;
    };
}

/**
 *  设置默认Task请求超时时间
 */
- (TXNetworkingManager *(^)(NSTimeInterval defaultTaskRequestTimeoutInterval))setDefaultTaskRequestTimeoutInterval {
    return ^TXNetworkingManager * (NSTimeInterval defaultTaskRequestTimeoutInterval) {
        self.config.requestConfig.defaultTaskRequestTimeoutInterval=defaultTaskRequestTimeoutInterval;
        return self;
    };
}

/**
 *  设置默认请求头(会覆盖之前的请求头)
 */
- (TXNetworkingManager *(^)(NSDictionary<NSString *, NSString*> * _Nonnull))setDefaultHeaders {
    return ^TXNetworkingManager * (NSDictionary<NSString *,NSString *> * _Nonnull defaultHeaders) {
        self.config.requestConfig.defaultHeaders=defaultHeaders;
        return self;
    };
}

/**
 *  添加默认请求头(不会覆盖之前的请求头)
 */
- (TXNetworkingManager *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))addDefaultHeaders {
    return ^TXNetworkingManager * (NSDictionary<NSString *,NSString *> * _Nonnull defaultHeaders) {
        NSMutableDictionary *mutableHeaders=[NSMutableDictionary dictionaryWithDictionary:self.config.requestConfig.defaultHeaders];
        [mutableHeaders addEntriesFromDictionary:defaultHeaders];
        self.config.requestConfig.defaultHeaders=mutableHeaders.mutableCopy;
        return self;
    };
}

/**
 *  设置默认请求参数(会覆盖之前的参数)
 */
- (TXNetworkingManager *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))setDefaultParameters {
    return ^TXNetworkingManager * (NSDictionary<NSString *,NSObject *> * _Nonnull defaultParameters) {
        self.config.requestConfig.defaultParameters=defaultParameters;
        return self;
    };
}

/**
 *  添加默认请求参数(不会覆盖之前的参数)
 */
- (TXNetworkingManager *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))addDefaultParameters {
    return ^TXNetworkingManager * (NSDictionary<NSString *,NSObject *> * _Nonnull defaultParameters) {
        NSMutableDictionary * mutableParameters=[NSMutableDictionary dictionaryWithDictionary:self.config.requestConfig.defaultParameters];
        [mutableParameters addEntriesFromDictionary:defaultParameters];
        self.config.requestConfig.defaultParameters=mutableParameters.mutableCopy;
        return self;
    };
}

/**
 *  设置默认内容类型(会覆盖之前的内容类型)
 */
- (TXNetworkingManager *(^)(NSSet<NSString *> *defaultContentTypes))setDefaultContentTypes {
    return ^TXNetworkingManager * (NSSet<NSString *> *defaultContentTypes) {
        self.config.requestConfig.defaultContentTypes=defaultContentTypes;
        return self;
    };
}

/**
 *  添加默认内容类型(不会覆盖之前的内容类型)
 */
- (TXNetworkingManager *(^)(NSSet<NSString *> *defaultContentTypes))addDefaultContentTypes {
    return ^TXNetworkingManager * (NSSet<NSString *> *defaultContentTypes) {
        NSMutableSet *mutableContentTypes=[NSMutableSet setWithSet:self.config.requestConfig.defaultContentTypes];
        NSEnumerator *enumerator=[defaultContentTypes objectEnumerator];
        NSString *value;
        while (value=[enumerator nextObject]) [mutableContentTypes addObject:value];
        self.config.requestConfig.defaultContentTypes=mutableContentTypes.mutableCopy;
        return self;
    };
}

/**
 *  设置默认的下载文件存储路径
 */
- (TXNetworkingManager *(^)(NSString * _Nullable))setDefaultDownloadFilePath{
    return ^TXNetworkingManager * (NSString * _Nonnull defaultDownloadFilePath) {
        self.config.requestConfig.defaultDownloadFilePath=defaultDownloadFilePath;
        return self;
    };
}

/**
 *  设置默认成功格式回调
 */
- (TXNetworkingManager *(^)(TXFormatHandler _Nullable))setDefaultSuccessFormatHandler {
    return ^TXNetworkingManager* (TXFormatHandler _Nullable defaultSuccessFormatHandler) {
        self.config.requestConfig.defaultSuccessFormatHandler=defaultSuccessFormatHandler;
        return self;
    };
}

/**
 *  设置默认失败格式回调
 */
- (TXNetworkingManager *(^)(TXFormatHandler _Nullable))setDefaultFailureFormatHandler {
    return ^TXNetworkingManager* (TXFormatHandler _Nullable defaultFailureFormatHandler) {
        self.config.requestConfig.defaultFailureFormatHandler=defaultFailureFormatHandler;
        return self;
    };
}

/**
 *  设置默认进度格式回调
 */
- (TXNetworkingManager *(^)(TXFormatHandler _Nullable))setDefaultProgressFormatHandler {
    return ^TXNetworkingManager* (TXFormatHandler _Nullable defaultProgressFormatHandler) {
        self.config.requestConfig.defaultProgressFormatHandler=defaultProgressFormatHandler;
        return self;
    };
}

@end
