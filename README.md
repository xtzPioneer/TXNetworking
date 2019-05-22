# TXNetworking
基于AFNetworking开发的网络管理工具,采用了链式编程、函数式编程、以及离散式编程。使其降低开发成本、提升开发速率。该框架还采用了扩展式开发使其易扩展、易更改。
### 安装
```ruby
pod 'TXNetworking'
```
### 使用教程
```objc
#import "TXNetworking.h"
```
#### 设置配置-方法1
```objc
[TXNetworkingManager setConfig:^(TXNetworkingConfig * _Nonnull config) {
     config.requestConfig.defaultBaseURL=@"www.test";
     config.requestConfig.defaultHeaders=@{@"test":@"Headers"};
     config.requestConfig.defaultParameters=@{@"test":@"parameters"};
     config.requestConfig.defaultContentTypes=[NSSet setWithObjects:@"test-ContentTypes", nil];
     config.requestConfig.defaultAPIRequestTimeoutInterval=10.f;
     config.requestConfig.defaultTaskRequestTimeoutInterval=120.f;
     config.requestConfig.defaultDownloadFilePath=@"test/DownloadFilePath";
     config.deBugConfig.defaultDeBug=NO;
}];
```
#### 设置配置-方法2
```objc
[TXNetworkingManager manager]
.setDefaultBaseURL(@"-www.test")
.setDefaultHeaders(@{@"test":@"test2-Headers"})
.addDefaultHeaders(@{@"test2":@"add-test2-Headers"})
.setDefaultParameters(@{@"test":@"test2-Parameters"})
.addDefaultParameters(@{@"test2":@"add-test2-Parameters"})
.setDefaultContentTypes([NSSet setWithObjects:@"test2-ContentTypes", nil])
.addDefaultContentTypes([NSSet setWithObjects:@"add-test2-ContentTypes", nil])
.setDefaultAPIRequestTimeoutInterval(40.f)
.setDefaultTaskRequestTimeoutInterval(240.f)
.setDefaultDownloadFilePath(@"test/DownloadFilePath")
.setDeBug(YES)
.setDefaultSuccessFormatHandler(^ id (id obj){
     return @{
     @"title":@"我拦截了成功",
     @"data":obj
     };
 })
.setDefaultFailureFormatHandler(^ id (id obj){
     return @{
     @"title":@"我拦截了故障",
     @"data":obj
     };
})
.setDefaultProgressFormatHandler(^ id (id obj){
     return @{
     @"title":@"我拦截了进度",
     @"data":obj
     };
});
```
### 设置总结
* 总结：方法1和方法2具备相同设置功能,但方法2设置功能更多、更齐全以及更方便。
### 代码片段
```objc

/**
 *  设置API请求
 */
@interface TXAPIRequest (TXSetAPIRequest)

/**
 *  设置请求类型
 */
- (TXAPIRequest *(^)(TXAPIRequestMethodType method))setMethod;

/**
 *  设置请求的URL
 */
- (TXAPIRequest *(^)(NSString * _Nonnull))setURL;

/**
 *  设置请求的baseURL
 */
- (TXAPIRequest *(^)(NSString * _Nullable))setBaseURL;

/**
 *  设置请求的超时间隔
 */
- (TXAPIRequest *(^)(NSTimeInterval timeoutInterval))setTimeoutInterval;

/**
 *  设置请求头(会覆盖之前的请求头)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))setHeaders;

/**
 *  添加请求头(不会覆盖之前的请求头)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))addHeaders;

/**
 *  设置请求的参数(会覆盖之前的参数)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))setParameters;

/**
 *  添加请求参数(不会覆盖之前的参数)
 */
- (TXAPIRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))addParameters;

/**
 *  设置请求的默认内容类型(会覆盖之前的内容类型)
 */
- (TXAPIRequest *(^)(NSSet<NSString *> *contentTypes))setContentTypes;

/**
 *  添加请求的默认内容类型(不会覆盖之前的内容类型)
 */
- (TXAPIRequest *(^)(NSSet<NSString *> *contentTypes))addContentTypes;

/**
 *  设置请求的结果回调
 */
- (TXAPIRequest *(^)(TXSuccessHandler _Nullable))setSuccessHandler;

/**
 *  设置请求的失败回调
 */
- (TXAPIRequest *(^)(TXFailureHandler _Nullable))setFailureHandler;

/**
 *  设置请求的进度回调
 */
- (TXAPIRequest *(^)(TXProgressHandler _Nullable))setProgressHandler;

/**
 *  设置成功格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setSuccessFormatHandler;

/**
 *  设置失败格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setFailureFormatHandler;

/**
 *  设置进度格式回调
 */
- (TXAPIRequest *(^)(TXFormatHandler _Nullable))setProgressFormatHandler;

/**
 *  设置API请求状态回调
 */
- (TXAPIRequest *(^)(TXAPIRequestStateHandler _Nullable))setStateHandler;

/**
 *  设置是否DeBug
 */
- (TXAPIRequest *(^)(BOOL deBug))setDeBug;

/**
 *  设置DeBug回调
 */
- (TXAPIRequest *(^)(TXDeBugHandler _Nullable))setDeBugHandler;

/**
 *  开始请求
 */
- (TXAPIRequest *(^)(void))start;

/**
 *  取消请求
 */
- (TXAPIRequest *(^)(void))cancel;

@end

/**
 *  设置任务请求
 */
@interface TXTaskRequest (TXSetTaskRequest)

/**
 *  设置请求类型
 */
- (TXTaskRequest *(^)(TXTaskRequestMethodType method))setMethod;

/**
 *  设置请求的URL
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setURL;

/**
 *  设置请求的baseURL
 */
- (TXTaskRequest *(^)(NSString * _Nullable))setBaseURL;

/**
 *  设置请求的超时间隔
 */
- (TXTaskRequest *(^)(NSTimeInterval timeoutInterval))setTimeoutInterval;

/**
 *  设置请求头(会覆盖之前的请求头)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))setHeaders;

/**
 *  添加请求头(不会覆盖之前的请求头)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSString *> * _Nonnull))addHeaders;

/**
 *  设置请求的参数(会覆盖之前的参数)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))setParameters;

/**
 *  添加请求参数(不会覆盖之前的参数)
 */
- (TXTaskRequest *(^)(NSDictionary<NSString *,NSObject *> * _Nonnull))addParameters;

/**
 *  设置请求的默认内容类型(会覆盖之前的内容类型)
 */
- (TXTaskRequest *(^)(NSSet<NSString *> *contentTypes))setContentTypes;

/**
 *  添加请求的默认内容类型(不会覆盖之前的内容类型)
 */
- (TXTaskRequest *(^)(NSSet<NSString *> *contentTypes))addContentTypes;

/**
 *  设置请求的结果回调
 */
- (TXTaskRequest *(^)(TXSuccessHandler _Nullable))setSuccessHandler;

/**
 *  设置请求的失败回调
 */
- (TXTaskRequest *(^)(TXFailureHandler _Nullable))setFailureHandler;

/**
 *  设置请求的进度回调
 */
- (TXTaskRequest *(^)(TXProgressHandler _Nullable))setProgressHandler;

/**
 *  设置成功格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setSuccessFormatHandler;

/**
 *  设置失败格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setFailureFormatHandler;

/**
 *  设置进度格式回调
 */
- (TXTaskRequest *(^)(TXFormatHandler _Nullable))setProgressFormatHandler;

/**
 *  设置FormData回调
 */
- (TXTaskRequest *(^)(TXAFMultipartFormDataHandler _Nullable))setMultipartFormDataHandler;

/**
 *  设置下载文件存储路径
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setDownloadFilePath;

/**
 *  设置下载文件的名字
 */
- (TXTaskRequest *(^)(NSString * _Nonnull))setDownloadFileName;

/**
 *  设置任务请求状态回调
 */
- (TXTaskRequest *(^)(TXTaskRequestStateHandler _Nullable))setStateHandler;

/**
 *  设置是否DeBug
 */
- (TXTaskRequest *(^)(BOOL deBug))setDeBug;

/**
 *  设置DeBug回调
 */
- (TXTaskRequest *(^)(TXDeBugHandler _Nullable))setDeBugHandler;

/**
 *  开始请求
 */
- (TXTaskRequest *(^)(void))start;

/**
 *  取消请求
 */
- (TXTaskRequest *(^)(void))cancel;

/**
 *  继续请求
 */
- (TXTaskRequest *(^)(void))resume;

/**
 *  暂停请求
 */
- (TXTaskRequest *(^)(void))pause;

@end

```
