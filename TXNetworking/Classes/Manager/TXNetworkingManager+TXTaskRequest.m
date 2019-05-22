//
//  TXNetworkingManager+TXTaskRequest.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/16.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXNetworkingManager+TXTaskRequest.h"
#import "TXNetworkingManager+TXTaskManager.h"

@implementation TXNetworkingManager (TXTaskRequest)

/**
 *  开始任务请求(对象方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
- (TXTaskRequest * _Nonnull)startTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request {
    // 判断任务池中是否存在该任务
    if ([self isExistsTaskWithKey:[NSString hashWithObject:request]]) return request;
    // 任务
    NSURLSessionTask *task;
    // 请求方法
    switch (request.method) {
        case Upload: {
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
            // 创建任务
            task=[aFHTTPManager POST:[NSString appendingStringWithString1:request.baseURL string2:request.url] parameters:request.parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                // FormData回调
                if (request.multipartFormDataHandler) request.multipartFormDataHandler(formData);
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                // 进度格式回调
                if (request.progressFormatHandler && request.progressHandler) {
                    id progressObj=request.progressFormatHandler(uploadProgress);
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
                request.state=TXTaskRequestStateCompleted;
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
                request.state=TXTaskRequestStateCancel;
                // 状态回调
                if (request.stateHandler) request.stateHandler(request.state);
            }];
        }
            break;
        case Download: {
            // 创建配置
            NSURLSessionConfiguration *aConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
            // 创建管理器
            AFURLSessionManager *aSessionManager=[[AFURLSessionManager alloc] initWithSessionConfiguration:aConfiguration];
            // 创建请求
            NSMutableURLRequest *aRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString appendingStringWithString1:request.baseURL string2:request.url]]];
            // 设置请求超时时间
            aRequest.timeoutInterval=request.timeoutInterval;
            // 添加请求头
            [request.headers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                [aRequest setValue:obj forHTTPHeaderField:key];
            }];
            // 创建任务
            task=[aSessionManager downloadTaskWithRequest:aRequest progress:^(NSProgress * _Nonnull downloadProgress) {
                // 进度格式回调
                if (request.progressFormatHandler && request.progressHandler) {
                    id progressObj=request.progressFormatHandler(downloadProgress);
                    request.progressHandler(progressObj);
                }
            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                // 文件管理器
                NSFileManager *fileManager=[NSFileManager defaultManager];
                // 创建文件夹
                [fileManager createDirectoryAtPath:request.downloadFilePath withIntermediateDirectories:YES attributes:nil error:nil];
                // 创建文件路径URL
                NSURL *filePathURL=[NSURL fileURLWithPath:request.downloadFilePath];
                // 返回文件的路径URL
                NSURL *returnFilePathURL=request.downloadFileName && request.downloadFileName.length>0 ? [filePathURL URLByAppendingPathComponent:request.downloadFileName] : [filePathURL URLByAppendingPathComponent:[response suggestedFilename]];
                return returnFilePathURL;
            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                // 移除任务池中的该任务
                [self removeTaskWithKey:[NSString hashWithObject:request]];
                // 回调
                if (!error) {
                    // 成功格式回调
                    if (request.successFormatHandler && request.successHandler) {
                        id successObj=request.successFormatHandler(filePath);
                        request.successHandler(successObj);
                    }
                    // 更新状态
                    request.state=TXTaskRequestStateCompleted;
                    // 状态回调
                    if (request.stateHandler) request.stateHandler(request.state);
                }else{
                    // 失败格式回调
                    if (request.failureFormatHandler && request.failureHandler) {
                        id failureObj=request.failureFormatHandler(error);
                        request.failureHandler(failureObj);
                    }
                    // 更新状态
                    request.state=TXTaskRequestStateCancel;
                    // 状态回调
                    if (request.stateHandler) request.stateHandler(request.state);
                }
            }];
            // 开始任务
            [task resume];
        }
            break;
        default:
            break;
    }
    // 添加任务
    [self addTaskWithTask:task key:[NSString hashWithObject:request]];
    // 更新状态
    request.state=TXTaskRequestStateRunning;
    // 状态回调
    if (request.stateHandler) request.stateHandler(request.state);
    // 返回请求
    return request;
}

/**
 *  开始任务请求(类方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
+ (TXTaskRequest * _Nonnull)startTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request {
    return [[self manager] startTaskRequestWithRequest:request];
}

/**
 *  取消任务请求(对象方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
- (TXTaskRequest * _Nonnull)cancelTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request {
    if ([self isExistsTaskWithKey:[NSString hashWithObject:request]]) {
        [(NSURLSessionTask*)self.tasks[[NSString hashWithObject:request]] cancel];
    }
    return request;
}

/**
 *  取消任务请求(类方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
+ (TXTaskRequest * _Nonnull)cancelTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request {
    return [[self manager] cancelTaskRequestWithRequest:request];
}

/**
 *  继续任务请求(对象方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
- (TXTaskRequest * _Nonnull)resumeTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request {
    if ([self isExistsTaskWithKey:[NSString hashWithObject:request]]) {
        NSURLSessionTask *task=(NSURLSessionTask*)self.tasks[[NSString hashWithObject:request]];
        if (task.state==NSURLSessionTaskStateSuspended) {
            // 继续
            [task resume];
            // 更新状态
            request.state=TXTaskRequestStateRunning;
            // 状态回调
            if (request.stateHandler) request.stateHandler(request.state);
        }
    }
    return request;
}

/**
 *  继续任务请求(类方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
+ (TXTaskRequest * _Nonnull)resumeTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request {
    return [[self manager] resumeTaskRequestWithRequest:request];
}

/**
 *  暂停任务请求(对象方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
- (TXTaskRequest * _Nonnull)pauseTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request {
    if ([self isExistsTaskWithKey:[NSString hashWithObject:request]]) {
        NSURLSessionTask *task=(NSURLSessionTask*)self.tasks[[NSString hashWithObject:request]];
        if (task.state==NSURLSessionTaskStateRunning) {
            // 暂停
            [task suspend];
            // 更新状态
            request.state=TXTaskRequestStatePause;
            // 状态回调
            if (request.stateHandler) request.stateHandler(request.state);
        }
    }
    return request;
}

/**
 *  暂停任务请求(类方法)
 *
 *  @param request 任务请求
 *
 *  @return TXTaskRequest 任务请求
 */
+ (TXTaskRequest * _Nonnull)pauseTaskRequestWithRequest:(TXTaskRequest * _Nonnull)request {
    return [[self manager] pauseTaskRequestWithRequest:request];
}

@end
