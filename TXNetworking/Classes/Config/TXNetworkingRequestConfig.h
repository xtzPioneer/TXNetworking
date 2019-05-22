//
//  TXNetworkingRequestConfig.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/14.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXNetworkingConst.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  网络请求配置
 */
@interface TXNetworkingRequestConfig : NSObject <NSCopying,NSMutableCopying>

/**
 *  请求的默认baseURL
 */
@property (nonatomic,copy)NSString *defaultBaseURL;

/**
 *  请求的默认API请求超时间隔
 */
@property (nonatomic,assign)NSTimeInterval defaultAPIRequestTimeoutInterval;

/**
 *  请求的默认Task请求超时间隔
 */
@property (nonatomic,assign)NSTimeInterval defaultTaskRequestTimeoutInterval;

/**
 *  请求的默认请求头集合
 */
@property (nonatomic,strong)NSDictionary<NSString *,NSString *> *defaultHeaders;

/**
 *  请求的默认的parameters
 */
@property (nonatomic,strong)NSDictionary<NSString *,NSObject *> *defaultParameters;

/**
 *  请求的默认内容类型
 */
@property (nonatomic,copy)NSSet<NSString *> *defaultContentTypes;

/**
 *  默认的下载文件存储路径
 */
@property (nonatomic,copy)NSString *defaultDownloadFilePath;

/**
 *  请求的默认成功格式回调
 */
@property (nonatomic,copy)TXFormatHandler defaultSuccessFormatHandler;

/**
 *  请求的默认失败格式回调
 */
@property (nonatomic,copy)TXFormatHandler defaultFailureFormatHandler;

/**
 *  请求的默认进度格式回调
 */
@property (nonatomic,copy)TXFormatHandler defaultProgressFormatHandler;

/**
 *  快速构建网络请求配置
 */
+ (instancetype)config;

// 禁止使用下面方法创建对象
- (instancetype)init __attribute__((unavailable("请使用config方法创建对象")));
+ (instancetype)new __attribute__((unavailable("请使用config方法创建对象")));

@end

NS_ASSUME_NONNULL_END
