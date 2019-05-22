//
//  TXTaskRequest+TXSetTaskRequest.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXTaskRequest+TXSetTaskRequest.h"

@implementation TXTaskRequest (TXSetTaskRequest)

/**
 *  设置请求类型
 */
- (TXTaskRequest *(^)(TXTaskRequestMethodType method))setMethod {
    return ^TXTaskRequest * (TXTaskRequestMethodType method) {
        self.method=method;
        return self;
    };
}

/**
 *  设置请求的URL
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setURL {
    return ^TXTaskRequest * (NSString * _Nonnull url) {
        self.url=url;
        return self;
    };
}

/**
 *  设置请求的baseURL
 */
- (TXTaskRequest *(^)(NSString * _Nullable))setBaseURL {
    return ^TXTaskRequest * (NSString * _Nonnull baseURL) {
        self.baseURL=baseURL;
        return self;
    };
}

/**
 *  设置请求的超时间隔
 */
- (TXTaskRequest *(^)(NSTimeInterval timeoutInterval))setTimeoutInterval {
    return ^TXTaskRequest * (NSTimeInterval timeoutInterval) {
        self.timeoutInterval=timeoutInterval;
        return self;
    };
}

/**
 *  设置请求头(会覆盖之前的请求头)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))setHeaders {
    return ^TXTaskRequest * (NSDictionary<NSString *,NSString *> * _Nonnull headers) {
        self.headers=headers;
        return self;
    };
}

/**
 *  添加请求头(不会覆盖之前的请求头)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))addHeaders {
    return ^TXTaskRequest * (NSDictionary<NSString *,NSString *> * _Nonnull headers) {
        NSMutableDictionary *mutableHeaders=[NSMutableDictionary dictionaryWithDictionary:self.headers];
        [mutableHeaders addEntriesFromDictionary:headers];
        self.headers=mutableHeaders.mutableCopy;
        return self;
    };
}

/**
 *  设置请求的参数(会覆盖之前的参数)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))setParameters {
    return ^TXTaskRequest * (NSDictionary<NSString *,NSObject *> * _Nonnull parameters) {
        self.parameters=parameters;
        return self;
    };
}

/**
 *  添加请求参数(不会覆盖之前的参数)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))addParameters{
    return ^TXTaskRequest * (NSDictionary<NSString *,NSObject *> * _Nonnull parameters) {
        NSMutableDictionary * mutableParameters=[NSMutableDictionary dictionaryWithDictionary:self.parameters];
        [mutableParameters addEntriesFromDictionary:parameters];
        self.parameters=mutableParameters.mutableCopy;
        return self;
    };
}

/**
 *  设置请求的默认内容类型(会覆盖之前的内容类型)
 */
- (TXTaskRequest *(^)(NSSet<NSString *> *contentTypes))setContentTypes {
    return ^TXTaskRequest * (NSSet<NSString *> *contentTypes) {
        self.contentTypes=contentTypes;
        return self;
    };
}

/**
 *  添加请求的默认内容类型(不会覆盖之前的内容类型)
 */
- (TXTaskRequest *(^)(NSSet<NSString *> *contentTypes))addContentTypes {
    return ^TXTaskRequest * (NSSet<NSString *> *contentTypes) {
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
- (TXTaskRequest *(^)(TXSuccessHandler _Nullable))setSuccessHandler {
    return ^TXTaskRequest* (TXSuccessHandler _Nullable successHandler) {
        self.successHandler=successHandler;
        return self;
    };
}

/**
 *  设置请求的失败回调
 */
- (TXTaskRequest *(^)(TXFailureHandler _Nullable))setFailureHandler {
    return ^TXTaskRequest* (TXFailureHandler _Nullable failureHandler) {
        self.failureHandler=failureHandler;
        return self;
    };
}

/**
 *  设置请求的进度回调
 */
- (TXTaskRequest *(^)(TXProgressHandler _Nullable))setProgressHandler {
    return ^TXTaskRequest* (TXProgressHandler _Nullable progressHandler) {
        self.progressHandler=progressHandler;
        return self;
    };
}

/**
 *  设置成功格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setSuccessFormatHandler {
    return ^TXTaskRequest* (TXFormatHandler _Nullable successFormatHandler) {
        self.successFormatHandler=successFormatHandler;
        return self;
    };
}

/**
 *  设置失败格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setFailureFormatHandler {
    return ^TXTaskRequest* (TXFormatHandler _Nullable failureFormatHandler) {
        self.failureFormatHandler=failureFormatHandler;
        return self;
    };
}

/**
 *  设置进度格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setProgressFormatHandler {
    return ^TXTaskRequest* (TXFormatHandler _Nullable progressFormatHandler) {
        self.progressFormatHandler=progressFormatHandler;
        return self;
    };
}

/**
 *  设置FormData回调
 */
- (TXTaskRequest *(^)(TXAFMultipartFormDataHandler _Nullable))setMultipartFormDataHandler {
    return ^TXTaskRequest* (TXAFMultipartFormDataHandler _Nullable multipartFormDataHandler) {
        self.multipartFormDataHandler=multipartFormDataHandler;
        return self;
    };
}

/**
 *  设置下载文件存储路径
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setDownloadFilePath {
    return ^TXTaskRequest * (NSString * _Nonnull downloadFilePath) {
        self.downloadFilePath=downloadFilePath;
        return self;
    };
}

/**
 *  设置下载文件的名字
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setDownloadFileName{
    return ^TXTaskRequest * (NSString * _Nonnull downloadFileName) {
        self.downloadFileName=downloadFileName;
        return self;
    };
}

/**
 *  设置任务请求状态回调
 */
- (TXTaskRequest *(^)(TXTaskRequestStateHandler _Nullable))setStateHandler {
    return ^TXTaskRequest* (TXTaskRequestStateHandler _Nullable stateHandler) {
        self.stateHandler=stateHandler;
        return self;
    };
}

/**
 *  设置是否DeBug
 */
- (TXTaskRequest *(^)(BOOL deBug))setDeBug {
    return ^TXTaskRequest * (BOOL deBug) {
        self.deBug=deBug;
        return self;
    };
}

/**
 *  设置DeBug回调
 */
- (TXTaskRequest *(^)(TXDeBugHandler _Nullable))setDeBugHandler {
    return ^TXTaskRequest* (TXDeBugHandler _Nullable deBugHandler) {
        if (deBugHandler) deBugHandler(self.deBugParameters);
        return self;
    };
}

/**
 *  开始请求
 */
- (TXTaskRequest *(^)(void))start {
    return ^TXTaskRequest* (void) {
        return [self startTaskRequest];
    };
}

/**
 *  取消请求
 */
- (TXTaskRequest *(^)(void))cancel {
    return ^TXTaskRequest* (void) {
        return [self cancelTaskRequest];
    };
}

/**
 *  继续请求
 */
- (TXTaskRequest *(^)(void))resume {
    return ^TXTaskRequest* (void) {
        return [self resumeTaskRequest];
    };
}

/**
 *  暂停请求
 */
- (TXTaskRequest *(^)(void))pause {
    return ^TXTaskRequest* (void) {
        return [self pauseTaskRequest];
    };
}

@end
