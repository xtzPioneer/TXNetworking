//
//  TXNetworkingRequestConfig.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingRequestConfig.h"

@implementation TXNetworkingRequestConfig

/**
 *  快速构建网络请求配置
 */
+ (instancetype)config{
    return [[self alloc] init];
}

/**
 *  重写init方法
 */
- (instancetype)init {
    if (self = [super init]) {
        _defaultAPIRequestTimeoutInterval=30.f;
        _defaultSuccessFormatHandler= ^id _Nullable(id  _Nullable obj) {
            return obj;
        };
        _defaultFailureFormatHandler= ^id _Nullable(id  _Nullable obj) {
            return obj;
        };
        _defaultProgressFormatHandler = ^id _Nullable(id  _Nullable obj) {
            return obj;
        };
        _defaultContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
        NSString *documents=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *folderName=@"Download";
        NSString *folderPath=[NSString stringWithFormat:@"%@/%@",documents,folderName];
        _defaultDownloadFilePath=folderPath;
    }
    return self;
}

/**
 *  NSCopying 协议 copy
 */
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    TXNetworkingRequestConfig *config=[[[self class] allocWithZone:zone] init];
    config.defaultHeaders=[_defaultHeaders copy];
    config.defaultAPIRequestTimeoutInterval=_defaultAPIRequestTimeoutInterval;
    config.defaultTaskRequestTimeoutInterval=_defaultTaskRequestTimeoutInterval;
    config.defaultBaseURL=[_defaultBaseURL copy];
    config.defaultParameters=[_defaultParameters copy];
    config.defaultContentTypes=[_defaultContentTypes copy];
    config.defaultDownloadFilePath=[_defaultDownloadFilePath copy];
    config.defaultSuccessFormatHandler=_defaultSuccessFormatHandler;
    config.defaultFailureFormatHandler=_defaultFailureFormatHandler;
    config.defaultProgressFormatHandler=_defaultProgressFormatHandler;
    return config;
}

/**
 *  NSCopying 协议 mutableCopy
 */
- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    TXNetworkingRequestConfig *config=[[[self class] allocWithZone:zone] init];
    config.defaultHeaders=[_defaultHeaders mutableCopy];
    config.defaultAPIRequestTimeoutInterval=_defaultAPIRequestTimeoutInterval;
    config.defaultTaskRequestTimeoutInterval=_defaultTaskRequestTimeoutInterval;
    config.defaultBaseURL=[_defaultBaseURL mutableCopy];
    config.defaultParameters=[_defaultParameters mutableCopy];
    config.defaultContentTypes=[_defaultContentTypes mutableCopy];
    config.defaultDownloadFilePath=[_defaultDownloadFilePath mutableCopy];
    config.defaultSuccessFormatHandler=_defaultSuccessFormatHandler;
    config.defaultFailureFormatHandler=_defaultFailureFormatHandler;
    config.defaultProgressFormatHandler=_defaultProgressFormatHandler;
    return config;
}

@end
