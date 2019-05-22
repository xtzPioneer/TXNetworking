//
//  TXAPIRequest+TXSetAPIRequest.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/15.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXAPIRequest+TXSetAPIRequest.h"

@implementation TXAPIRequest (TXSetAPIRequest)

/**
 *  设置请求类型
 */
- (TXAPIRequest *(^)(TXAPIRequestMethodType method))setMethod {
    return ^TXAPIRequest * (TXAPIRequestMethodType method) {
        self.method=method;
        return self;
    };
}

/**
 *  设置请求的URL
 */
- (TXAPIRequest *(^)(NSString * _Nonnull))setURL {
    return ^TXAPIRequest * (NSString * _Nonnull url) {
        self.url=url;
        return self;
    };
}

/**
 *  设置请求的baseURL
 */
- (TXAPIRequest *(^)(NSString * _Nullable))setBaseURL {
    return ^TXAPIRequest * (NSString * _Nonnull baseURL) {
        self.baseURL=baseURL;
        return self;
    };
}

/**
 *  设置请求的超时间隔
 */
- (TXAPIRequest *(^)(NSTimeInterval timeoutInterval))setTimeoutInterval {
    return ^TXAPIRequest * (NSTimeInterval timeoutInterval) {
        self.timeoutInterval=timeoutInterval;
        return self;
    };
}

/**
 *  设置请求头(会覆盖之前的请求头)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *, NSString*> * _Nonnull))setHeaders {
    return ^TXAPIRequest * (NSDictionary<NSString *,NSString *> * _Nonnull headers) {
        self.headers=headers;
        return self;
    };
}

/**
 *  添加请求头(不会覆盖之前的请求头)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))addHeaders {
    return ^TXAPIRequest * (NSDictionary<NSString *,NSString *> * _Nonnull headers) {
        NSMutableDictionary *mutableHeaders=[NSMutableDictionary dictionaryWithDictionary:self.headers];
        [mutableHeaders addEntriesFromDictionary:headers];
        self.headers=mutableHeaders.mutableCopy;
        return self;
    };
}

/**
 *  设置请求的参数(会覆盖之前的参数)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))setParameters {
    return ^TXAPIRequest * (NSDictionary<NSString *,NSObject *> * _Nonnull parameters) {
        self.parameters=parameters;
        return self;
    };
}

/**
 *  添加请求参数(不会覆盖之前的参数)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))addParameters {
    return ^TXAPIRequest * (NSDictionary<NSString *,NSObject *> * _Nonnull parameters) {
        NSMutableDictionary * mutableParameters=[NSMutableDictionary dictionaryWithDictionary:self.parameters];
        [mutableParameters addEntriesFromDictionary:parameters];
        self.parameters=mutableParameters.mutableCopy;
        return self;
    };
}

/**
 *  设置请求的默认内容类型(会覆盖之前的内容类型)
 */
- (TXAPIRequest *(^)(NSSet<NSString *> *contentTypes))setContentTypes {
    return ^TXAPIRequest * (NSSet<NSString *> *contentTypes) {
        self.contentTypes=contentTypes;
        return self;
    };
}

/**
 *  添加请求的默认内容类型(不会覆盖之前的内容类型)
 */
- (TXAPIRequest *(^)(NSSet<NSString *> *contentTypes))addContentTypes {
    return ^TXAPIRequest * (NSSet<NSString *> *contentTypes) {
        NSMutableSet *mutableContentTypes=[NSMutableSet setWithSet:self.contentTypes];
        NSEnumerator *enumerator=[contentTypes objectEnumerator];
        NSString *value;
        while (value=[enumerator nextObject]) [mutableContentTypes addObject:value];
        self.contentTypes=mutableContentTypes.mutableCopy;
        return self;
    };
}

/**
 *  设置请求的结果回调
 */
- (TXAPIRequest *(^)(TXSuccessHandler _Nullable))setSuccessHandler {
    return ^TXAPIRequest* (TXSuccessHandler _Nullable successHandler) {
        self.successHandler=successHandler;
        return self;
    };
}

/**
 *  设置请求的失败回调
 */
- (TXAPIRequest *(^)(TXFailureHandler _Nullable))setFailureHandler{
    return ^TXAPIRequest* (TXFailureHandler _Nullable failureHandler) {
        self.failureHandler=failureHandler;
        return self;
    };
}

/**
 *  设置请求的进度回调
 */
- (TXAPIRequest *(^)(TXProgressHandler _Nullable))setProgressHandler{
    return ^TXAPIRequest* (TXProgressHandler _Nullable progressHandler) {
        self.progressHandler=progressHandler;
        return self;
    };
}

/**
 *  设置成功格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setSuccessFormatHandler {
    return ^TXAPIRequest* (TXFormatHandler _Nullable successFormatHandler) {
        self.successFormatHandler=successFormatHandler;
        return self;
    };
}

/**
 *  设置失败格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setFailureFormatHandler {
    return ^TXAPIRequest* (TXFormatHandler _Nullable failureFormatHandler) {
        self.failureFormatHandler=failureFormatHandler;
        return self;
    };
}

/**
 *  设置进度格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setProgressFormatHandler {
    return ^TXAPIRequest* (TXFormatHandler _Nullable progressFormatHandler) {
        self.progressFormatHandler=progressFormatHandler;
        return self;
    };
}

/**
 *  设置API请求状态回调
 */
- (TXAPIRequest *(^)(TXAPIRequestStateHandler _Nullable))setStateHandler {
    return ^TXAPIRequest* (TXAPIRequestStateHandler _Nullable stateHandler) {
        self.stateHandler=stateHandler;
        return self;
    };
}

/**
 *  设置是否DeBug
 */
- (TXAPIRequest *(^)(BOOL deBug))setDeBug{
    return ^TXAPIRequest * (BOOL deBug) {
        self.deBug=deBug;
        return self;
    };
}

/**
 *  设置DeBug回调
 */
- (TXAPIRequest *(^)(TXDeBugHandler _Nullable))setDeBugHandler{
    return ^TXAPIRequest* (TXDeBugHandler _Nullable deBugHandler) {
        if (deBugHandler) deBugHandler(self.deBugParameters);
        return self;
    };
}

/**
 *  开始请求
 */
- (TXAPIRequest *(^)(void))start {
    return ^TXAPIRequest* (void) {
        return [self startAPIRequest];
    };
}

/**
 *  取消请求
 */
- (TXAPIRequest *(^)(void))cancel {
    return ^TXAPIRequest* (void) {
        return [self cancelAPIRequest];
    };
}

@end
