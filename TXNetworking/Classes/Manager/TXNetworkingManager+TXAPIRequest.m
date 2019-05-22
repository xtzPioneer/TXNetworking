//
//  TXNetworkingManager+TXAPIRequest.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/15.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager+TXAPIRequest.h"
#import "TXNetworkingManager+TXTaskManager.h"

@implementation TXNetworkingManager (TXAPIRequest)

/**
 *  开始API请求(对象方法)
 *
 *  @param request API请求
 *
 *  @return TXAPIRequest API请求
 */
- (TXAPIRequest * _Nonnull)startAPIRequest:(TXAPIRequest * _Nonnull)request {
    // 判断任务池中是否存在该任务
    if ([self isExistsTaskWithKey:[NSString hashWithObject:request]]) return request;
    // 创建管理器
    AFHTTPSessionManager *aFHTTPManager=[AFHTTPSessionManager manager];
    // 设置请求超时时间
    [aFHTTPManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    aFHTTPManager.requestSerializer.timeoutInterval=request.timeoutInterval;
    [aFHTTPManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    // 设置内容类型
    aFHTTPManager.responseSerializer.acceptableContentTypes=request.contentTypes;
    // 设置请求头
    [request.headers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [aFHTTPManager.requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
    // 任务
    NSURLSessionTask *task;
    // 请求方法
    switch (request.method) {
        case GET: {
            // 创建任务
            task=[aFHTTPManager GET:[NSString appendingStringWithString1:request.baseURL string2:request.url] parameters:request.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                // 进度格式回调
                if (request.progressFormatHandler && request.progressHandler) {
                    id progressObj=request.progressFormatHandler(downloadProgress);
                    request.progressHandler(progressObj);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 成功格式回调
                if (request.successFormatHandler && request.successHandler) {
                    id successObj=request.successFormatHandler(responseObject);
                    request.successHandler(successObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCompleted;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 失败格式回调
                if (request.failureFormatHandler && request.failureHandler) {
                    id failureObj=request.failureFormatHandler(error);
                    request.failureHandler(failureObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCancel;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            }];
        }
            break;
        case POST: {
            // 创建任务
            task=[aFHTTPManager POST:[NSString appendingStringWithString1:request.baseURL string2:request.url] parameters:request.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                // 进度格式回调
                if (request.progressFormatHandler && request.progressHandler) {
                    id progressObj=request.progressFormatHandler(downloadProgress);
                    request.progressHandler(progressObj);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 成功格式回调
                if (request.successFormatHandler && request.successHandler) {
                    id successObj=request.successFormatHandler(responseObject);
                    request.successHandler(successObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCompleted;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 失败格式回调
                if (request.failureFormatHandler && request.failureHandler) {
                    id failureObj=request.failureFormatHandler(error);
                    request.failureHandler(failureObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCancel;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            }];
        }
            break;
        case PUT: {
            // 创建任务
            task=[aFHTTPManager PUT:[NSString appendingStringWithString1:request.baseURL string2:request.url] parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 成功格式回调
                if (request.successFormatHandler && request.successHandler) {
                    id successObj=request.successFormatHandler(responseObject);
                    request.successHandler(successObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCompleted;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 失败格式回调
                if (request.failureFormatHandler && request.failureHandler) {
                    id failureObj=request.failureFormatHandler(error);
                    request.failureHandler(failureObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCancel;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            }];
        }
            break;
        case PATCH: {
            // 创建任务
            task=[aFHTTPManager PATCH:[NSString appendingStringWithString1:request.baseURL string2:request.url] parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 成功格式回调
                if (request.successFormatHandler && request.successHandler) {
                    id successObj=request.successFormatHandler(responseObject);
                    request.successHandler(successObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCompleted;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 失败格式回调
                if (request.failureFormatHandler && request.failureHandler) {
                    id failureObj=request.failureFormatHandler(error);
                    request.failureHandler(failureObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCancel;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            }];
        }
            break;
        case DELETE: {
            // 创建任务
            task=[aFHTTPManager DELETE:[NSString appendingStringWithString1:request.baseURL string2:request.url] parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 成功格式回调
                if (request.successFormatHandler && request.successHandler) {
                    id successObj=request.successFormatHandler(responseObject);
                    request.successHandler(successObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCompleted;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 失败格式回调
                if (request.failureFormatHandler && request.failureHandler) {
                    id failureObj=request.failureFormatHandler(error);
                    request.failureHandler(failureObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCancel;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            }];
        }
            break;
        case HEAD: {
            // 创建任务
            task=[aFHTTPManager HEAD:[NSString appendingStringWithString1:request.baseURL string2:request.url] parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 成功格式回调
                if (request.successFormatHandler && request.successHandler) {
                    id successObj=request.successFormatHandler(task);
                    request.successHandler(successObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCompleted;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 失败格式回调
                if (request.failureFormatHandler && request.failureHandler) {
                    id failureObj=request.failureFormatHandler(error);
                    request.failureHandler(failureObj);
                }
                // 更新状态
                request.state=TXAPIRequestStateCancel;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            }];
        }
            break;
        default:
            break;
    }
    // 添加该任务
    [self addTaskWithTask:task key:[NSString hashWithObject:request]];
    // 更新状态
    request.state=TXAPIRequestStateRunning;
    // 状态回调
    if (request.stateHandler) request.stateHandler(request.state);
    // 返回请求
    return request;
}

/**
 *  开始API请求(类方法)
 *
 *  @param request API请求
 *
 *  @return TXAPIRequest API请求
 */
+ (TXAPIRequest * _Nonnull)startAPIRequest:(TXAPIRequest * _Nonnull)request {
    return [[self manager] startAPIRequest:request];
}

/**
 *  取消API请求(对象方法)
 *
 *  @param request API请求
 *
 *  @return TXAPIRequest API请求
 */
- (TXAPIRequest * _Nonnull)cancelAPIRequest:(TXAPIRequest * _Nonnull)request{
    if ([self isExistsTaskWithKey:[NSString hashWithObject:request]]) {
        [self.tasks[[NSString hashWithObject:request]] cancel];
    }
    return request;
}

/**
 *  取消API请求(类方法)
 *
 *  @param request API请求
 *
 *  @return TXAPIRequest API请求
 */
+ (TXAPIRequest * _Nonnull)cancelAPIRequest:(TXAPIRequest * _Nonnull)request {
    return [[self manager] cancelAPIRequest:request];
}

@end
