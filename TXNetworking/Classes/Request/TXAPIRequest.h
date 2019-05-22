//
//  TXAPIRequest.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXNetworkingConst.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  API请求
 */
@interface TXAPIRequest : NSObject <NSCopying,NSMutableCopying>

/**
 *  请求类型
 */
@property (nonatomic,assign)TXAPIRequestMethodType method;

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
 *  API请求状态
 */
@property (nonatomic,assign)TXAPIRequestState state;

/**
 *  API请求状态回调
 */
@property (nonatomic,copy)TXAPIRequestStateHandler stateHandler;

/**
 *  是否DeBug
 */
@property (nonatomic,assign)BOOL deBug;

/**
 *  deBug参数
 */
- (NSDictionary * _Nullable)deBugParameters;

/*
 *  开始API请求
 */
- (instancetype)startAPIRequest;

/*
 *  取消API请求
 */
- (instancetype)cancelAPIRequest;

/**
 *  快速构建请求
 */
+ (instancetype)request;

// 禁止使用下面方法创建对象
- (instancetype)init __attribute__((unavailable("请使用request方法创建对象")));
+ (instancetype)new __attribute__((unavailable("请使用request方法创建对象")));

@end

NS_ASSUME_NONNULL_END
