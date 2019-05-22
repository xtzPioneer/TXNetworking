//
//  TXTaskRequest.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXTaskRequest.h"
#import "TXNetworkingManager+TXTaskRequest.h"

@implementation TXTaskRequest

/**
 *  快速构建请求
 */
+ (instancetype)request {
    return [[self alloc] init];
}

/**
 *  重写init方法
 */
- (instancetype)init {
    if (self = [super init]) {
        _baseURL=[TXNetworkingManager config].requestConfig.defaultBaseURL;
        _timeoutInterval=[TXNetworkingManager config].requestConfig.defaultTaskRequestTimeoutInterval;
        _headers=[TXNetworkingManager config].requestConfig.defaultHeaders;
        _successFormatHandler=[TXNetworkingManager config].requestConfig.defaultSuccessFormatHandler;
        _failureFormatHandler=[TXNetworkingManager config].requestConfig.defaultFailureFormatHandler;
        _progressFormatHandler=[TXNetworkingManager config].requestConfig.defaultProgressFormatHandler;
        _parameters=[TXNetworkingManager config].requestConfig.defaultParameters;
        _contentTypes=[TXNetworkingManager config].requestConfig.defaultContentTypes;
        _downloadFilePath=[TXNetworkingManager config].requestConfig.defaultDownloadFilePath;
        _deBug=[TXNetworkingManager config].deBugConfig.defaultDeBug;
    }
    return self;
}

/*
 *  开始任务请求
 */
- (instancetype)startTaskRequest {
    return [TXNetworkingManager startTaskRequestWithRequest:self];
}

/*
 *  取消任务请求
 */
- (instancetype)cancelTaskRequest {
    return [TXNetworkingManager cancelTaskRequestWithRequest:self];
}

/**
 *  继续任务请求
 */
- (instancetype)resumeTaskRequest {
    return [TXNetworkingManager resumeTaskRequestWithRequest:self];
}

/**
 *  暂停任务请求
 */
- (instancetype)pauseTaskRequest {
    return [TXNetworkingManager pauseTaskRequestWithRequest:self];
}

/**
 *  deBug参数
 */
- (NSDictionary * _Nullable)deBugParameters{
    if (!self.deBug) return nil;
    NSMutableDictionary *mutableDictionary=[NSMutableDictionary dictionary];
    id url=self.url && self.url.length>0 ? self.url : @"尚未设置url";
    id baseURL=self.baseURL && self.baseURL.length>0 ? self.baseURL : @"尚未设置baseURL";
    id timeoutInterval=self.timeoutInterval>0 ? [NSString stringWithFormat:@"%ld",(long)self.timeoutInterval] : @"尚未设置请求超时时间";
    id parameters=self.parameters ? self.parameters : @"尚未设置参数";
    id headers=self.headers ? self.headers : @"尚未设置请求头";
    id contentTypes=self.contentTypes ? self.contentTypes : @"尚未设置内容类型";
    id downloadFilePath=self.downloadFilePath && self.downloadFilePath.length>0 ? self.downloadFilePath : @"尚未设置下载文件存储路径";
    id downloadFileName=self.downloadFileName && self.downloadFileName.length>0 ? self.downloadFileName : @"尚未设置下载文件的名字";
    [mutableDictionary setValue:[self analysisMethod] forKey:@"method"];
    [mutableDictionary setValue:url forKey:@"url"];
    [mutableDictionary setValue:baseURL forKey:@"baseURL"];
    [mutableDictionary setValue:timeoutInterval forKey:@"timeoutInterval"];
    [mutableDictionary setValue:parameters forKey:@"parameters"];
    [mutableDictionary setValue:headers forKey:@"headers"];
    [mutableDictionary setValue:contentTypes forKey:@"contentTypes"];
    [mutableDictionary setValue:downloadFilePath forKey:@"downloadFilePath"];
    [mutableDictionary setValue:downloadFileName forKey:@"downloadFileName"];
    return mutableDictionary;
}

/**
 *  解析方法类型
 */
- (NSString * _Nonnull)analysisMethod{
    id method=@"尚未设置方法";
    switch (self.method) {
        case Upload:{
            method=@"Upload";
        }
            break;
        case Download:{
            method=@"Download";
        }
            break;
        default:
            break;
    }
    return method;
}

/**
 *  NSCopying 协议 copy
 */
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    TXTaskRequest *request=[[[self class] allocWithZone:zone] init];
    request.method=_method;
    request.url=[_url copy];
    request.baseURL=[_baseURL copy];
    request.timeoutInterval=_timeoutInterval;
    request.headers=[_headers copy];
    request.parameters=[_parameters copy];
    request.contentTypes=[_contentTypes copy];
    request.successHandler=_successHandler;
    request.failureHandler=_failureHandler;
    request.progressHandler=_progressHandler;
    request.successFormatHandler=_successFormatHandler;
    request.failureFormatHandler=_failureFormatHandler;
    request.progressFormatHandler=_progressFormatHandler;
    request.downloadFilePath=[_downloadFilePath copy];
    request.downloadFileName=[_downloadFileName copy];
    request.state=_state;
    request.stateHandler=_stateHandler;
    request.deBug=_deBug;
    return request;
}

/**
 *  NSCopying 协议 mutableCopy
 */
- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    TXTaskRequest *request=[[[self class] allocWithZone:zone] init];
    request.method=_method;
    request.url=[_url mutableCopy];
    request.baseURL=[_baseURL mutableCopy];
    request.timeoutInterval=_timeoutInterval;
    request.headers=[_headers mutableCopy];
    request.parameters=[_parameters mutableCopy];
    request.contentTypes=[_contentTypes mutableCopy];
    request.successHandler=_successHandler;
    request.failureHandler=_failureHandler;
    request.progressHandler=_progressHandler;
    request.successFormatHandler=_successFormatHandler;
    request.failureFormatHandler=_failureFormatHandler;
    request.progressFormatHandler=_progressFormatHandler;
    request.downloadFilePath=[_downloadFilePath mutableCopy];
    request.downloadFileName=[_downloadFileName mutableCopy];
    request.state=_state;
    request.stateHandler=_stateHandler;
    request.deBug=_deBug;
    return request;
}

@end
