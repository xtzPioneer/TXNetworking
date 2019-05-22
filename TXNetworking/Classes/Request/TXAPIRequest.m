//
//  TXAPIRequest.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXAPIRequest.h"
#import "TXNetworkingManager+TXAPIRequest.h"

@implementation TXAPIRequest

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
        _timeoutInterval=[TXNetworkingManager config].requestConfig.defaultAPIRequestTimeoutInterval;
        _headers=[TXNetworkingManager config].requestConfig.defaultHeaders;
        _successFormatHandler=[TXNetworkingManager config].requestConfig.defaultSuccessFormatHandler;
        _failureFormatHandler=[TXNetworkingManager config].requestConfig.defaultFailureFormatHandler;
        _progressFormatHandler=[TXNetworkingManager config].requestConfig.defaultProgressFormatHandler;
        _parameters=[TXNetworkingManager config].requestConfig.defaultParameters;
        _contentTypes=[TXNetworkingManager config].requestConfig.defaultContentTypes;
        _deBug=[TXNetworkingManager config].deBugConfig.defaultDeBug;
    }
    return self;
}

/*
 *  开始API请求
 */
- (instancetype)startAPIRequest {
    return [TXNetworkingManager startAPIRequest:self];
}

/*
 *  取消API请求
 */
- (instancetype)cancelAPIRequest {
    return [TXNetworkingManager cancelAPIRequest:self];
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
    [mutableDictionary setValue:[self analysisMethod] forKey:@"method"];
    [mutableDictionary setValue:url forKey:@"url"];
    [mutableDictionary setValue:baseURL forKey:@"baseURL"];
    [mutableDictionary setValue:timeoutInterval forKey:@"timeoutInterval"];
    [mutableDictionary setValue:parameters forKey:@"parameters"];
    [mutableDictionary setValue:headers forKey:@"headers"];
    [mutableDictionary setValue:contentTypes forKey:@"contentTypes"];
    return mutableDictionary;
}

/**
 *  解析方法类型
 */
- (NSString * _Nonnull)analysisMethod{
    id method=@"尚未设置方法";
    switch (self.method) {
        case GET:{
            method=@"GET";
        }
            break;
        case POST:{
            method=@"POST";
        }
            break;
        case PUT:{
            method=@"PUT";
        }
            break;
        case PATCH:{
            method=@"PATCH";
        }
            break;
        case DELETE:{
            method=@"DELETE";
        }
            break;
        case HEAD:{
            method=@"HEAD";
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
    TXAPIRequest *request=[[[self class] allocWithZone:zone] init];
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
    request.state=_state;
    request.stateHandler=_stateHandler;
    request.deBug=_deBug;
    return request;
}

/**
 *  NSCopying 协议 mutableCopy
 */
- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    TXAPIRequest *request=[[[self class] allocWithZone:zone] init];
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
    request.state=_state;
    request.stateHandler=_stateHandler;
    request.deBug=_deBug;
    return request;
}

@end
