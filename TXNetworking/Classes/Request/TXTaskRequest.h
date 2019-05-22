//
//  TXTaskRequest.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXNetworkingConst.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  任务请求
 */
@interface TXTaskRequest : NSObject <NSCopying,NSMutableCopying>
/**
 *  请求类型
 */
@property (nonatomic,assign)TXTaskRequestMethodType method;

/**
 *  请求的URL
 */
@property (nonatomic,copy)NSString *url;

/**
 *  请求的baseURL
 */
@property (nonatomic,copy)NSString *baseURL;

/**
 *  请求的超时间隔
 */
@property (nonatomic,assign)NSTimeInterval timeoutInterval;

/**
 *  请求的请求头
 */
@property (nonatomic,strong)NSDictionary<NSString *,NSString *> *headers;

/**
 *  请求的参数
 */
@property (nonatomic,strong)NSDictionary<NSString *,NSObject *> *parameters;

/**
 *  请求的默认内容类型
 */
@property (nonatomic,copy)NSSet<NSString *> *contentTypes;

/**
 *  请求的结果回调
 */
@property (nonatomic,copy)TXSuccessHandler successHandler;

/**
 *  请求的失败回调
 */
@property (nonatomic,copy)TXFailureHandler failureHandler;

/**
 *  请求的进度回调
 */
@property (nonatomic,copy)TXProgressHandler progressHandler;

/**
 *  成功格式回调
 */
@property (nonatomic,copy)TXFormatHandler successFormatHandler;

/**
 *  失败格式回调
 */
@property (nonatomic,copy)TXFormatHandler failureFormatHandler;

/**
 *  进度格式回调
 */
@property (nonatomic,copy)TXFormatHandler progressFormatHandler;

/**
 *  FormData回调
 */
@property (nonatomic,copy)TXAFMultipartFormDataHandler multipartFormDataHandler;

/**
 *  下载文件存储路径
 */
@property (nonatomic,copy)NSString *downloadFilePath;

/**
 *  下载文件的名字 如：xxx.mp4
 */
@property (nonatomic,copy)NSString *downloadFileName;

/**
 *  任务请求状态
 */
@property (nonatomic,assign)TXTaskRequestState state;

/**
 *  任务请求状态回调
 */
@property (nonatomic,copy)TXTaskRequestStateHandler stateHandler;

/**
 *  是否DeBug
 */
@property (nonatomic,assign)BOOL deBug;

/**
 *  deBug参数
 */
- (NSDictionary * _Nullable)deBugParameters;

/*
 *  开始任务请求
 */
- (instancetype)startTaskRequest;

/*
 *  取消任务请求
 */
- (instancetype)cancelTaskRequest;

/**
 *  继续任务请求
 */
- (instancetype)resumeTaskRequest;

/**
 *  暂停任务请求
 */
- (instancetype)pauseTaskRequest;

/**
 *  快速构建请求
 */
+ (instancetype)request;

// 禁止使用下面方法创建对象
- (instancetype)init __attribute__((unavailable("请使用request方法创建对象")));
+ (instancetype)new __attribute__((unavailable("请使用request方法创建对象")));

@end

NS_ASSUME_NONNULL_END
