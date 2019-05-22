# TXNetworking
基于AFNetworking开发的网络管理工具,采用了链式编程、函数式编程、以及离散式编程。使其降低开发成本、提升开发速率。该框架还采用了扩展式开发使其易扩展、易更改。
### 功能及简介
* 1、集成 GET / POST / PUT / DELETE 等请求方式
* 2、集成 Upload / Download 任务上传和下载并且支持开始、暂停、继续等操作
* 3、支持请求头、内容类型、参数、超时时间等设置
* 4、支持拦截返回参数和自定义返回格式
* 5、采用链式编程
* 6、采用函数式编程
* 7、采用离散式编程
* 8、采用扩展式开发
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
#### API请求-方法1
```objc
TXAPIRequest *apiRequest=[TXAPIRequest request];
apiRequest.method=POST;
apiRequest.url=@"APItest";
apiRequest.baseURL=@"APItestbaseURL";
apiRequest.parameters=@{@"testAPIParameters":@"APIParameters"};
apiRequest.headers=@{@"testAPIHeaders":@"APIHeaders"};
apiRequest.contentTypes=[NSSet setWithObjects:@"testAPIContentTypes", nil];
apiRequest.timeoutInterval=50;
// 开始API请求
[apiRequest startAPIRequest];
// 取消API请求
[apiRequest cancelAPIRequest];
```
#### API请求-方法2
```objc
TXAPIRequest *apiRequest=[TXAPIRequest request];
apiRequest
.setMethod(GET)
.setURL(@"APItestURL-m2")
.setBaseURL(@"APItestbaseURL-m2")
.setParameters(@{@"APItestParameter":@"setf2"})
.addParameters(@{@"APItestParameter2":@"addf2"})
.setHeaders(@{@"APIHeaders":@"setf2"})
.addHeaders(@{@"APIHeaders2":@"addf2"})
.setContentTypes([NSSet setWithObjects:@"APISetContentTypes", nil])
.addContentTypes([NSSet setWithObjects:@"APIaddContentTypes", nil])
.setTimeoutInterval(60)
.setDeBug(NO)
.setSuccessHandler(^ (id obj){
        NSLog(@"成功回调:%@",obj);
})
.setFailureHandler(^ (id obj){
        NSLog(@"失败回调:%@",obj);
})
.setProgressHandler(^ (id obj){
        NSLog(@"进度回调:%@",obj);
})
.setStateHandler(^ (TXAPIRequestState state){
        switch (state) {
            case TXAPIRequestStateRunning: {
                NSLog(@"运行");
            }
                break;
            case TXAPIRequestStateCancel: {
                NSLog(@"取消");
            }
                break;
            case TXAPIRequestStateCompleted: {
                NSLog(@"完成");
            }
                break;
                
            default:
                break;
        }
})
.start();
```
#### Task请求-方法1
```objc
TXTaskRequest *taskRequest=[TXTaskRequest request];
taskRequest.method=Download;
taskRequest.url=@"TaskURL";
taskRequest.baseURL=@"TaskbaseURL";
taskRequest.parameters=@{@"testTaskParameters":@"TaskParameters"};
taskRequest.headers=@{@"testTaskHeaders":@"TaskHeaders"};
taskRequest.contentTypes=[NSSet setWithObjects:@"testTaskContentTypes", nil];
taskRequest.timeoutInterval=50;
taskRequest.downloadFilePath=@"testTaskDownloadFilePath";
taskRequest.downloadFileName=@"fileName.zip";
taskRequest.deBug=YES;
// 开始Task请求
[taskRequest startTaskRequest];
// 取消Task请求
[taskRequest cancelTaskRequest];
// 继续Task请求
[taskRequest resumeTaskRequest];
// 暂停Task请求
[taskRequest pauseTaskRequest];
```
#### Task请求-方法1
```objc
TXTaskRequest *taskRequest=[TXTaskRequest request];
taskRequest.setMethod(Upload)
.setURL(@"TaskURLf2")
.setBaseURL(@"TaskbaseURLf2")
.setParameters(@{@"testTaskParameters2":@"testTaskParameters2"})
.addParameters(@{@"addTestTaskParameters2":@"addTestTaskParameters2"})
.setHeaders(@{@"testTaskHeaders2":@"testTaskHeaders2"})
.addHeaders(@{@"addTestTaskHeaders2":@"addTestTaskHeaders2"})
.setContentTypes([NSSet setWithObject:@"testTaskContentTypes2"])
.addContentTypes([NSSet setWithObject:@"addTestTaskContentTypes2"])
.setTimeoutInterval(60)
.setDownloadFilePath(@"testTaskDownloadFilePathf2")
.setDeBug(YES)
.setSuccessHandler(^ (id obj) {
      // 回到主线程刷新UI
      dispatch_async(dispatch_get_main_queue(), ^{
          label.text=@"下载1下载成功";
      });
      NSLog(@"下载1:filePath:%@",obj);
})
.setFailureHandler(^ (id obj){
      // 回到主线程刷新UI
      dispatch_async(dispatch_get_main_queue(), ^{
          label1.text=@"下载1下载失败";
      });
})
.setProgressHandler(^ (id obj){
      // 回到主线程刷新UI
      dispatch_async(dispatch_get_main_queue(), ^{
          NSProgress *progress=obj;
          NSInteger completed=progress.fractionCompleted*100;
          label.text=[NSString stringWithFormat:@"下载1的进度:%ld%%",(long)completed];
      });
})
.setStateHandler(^ (TXTaskRequestState state){
     switch (state) {
         case TXTaskRequestStateRunning: {
              NSLog(@"下载1状态:运行");
         }
              break;
         case TXTaskRequestStatePause: {
              NSLog(@"下载1状态:暂停");
         }
              break;
         case TXTaskRequestStateCancel: {
              NSLog(@"下载1状态:取消");
         }
              break;
         case TXTaskRequestStateCompleted: {
              NSLog(@"下载1状态:完成");
         }
              break;
            default:
              break;
      }
})
.start();
```
#### 总结
* 方法1和方法2具备相同设置功能,但方法2设置功能更多、更齐全以及更方便。
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
