//
//  TXViewController.m
//  TXNetworking
//
//  Created by 907689522@qq.com on 05/21/2019.
//  Copyright (c) 2019 907689522@qq.com. All rights reserved.
//

#import "TXViewController.h"
#import "TXNetworking.h"

@interface TXViewController ()
@property (nonatomic,strong)TXTaskRequest *download1;
@property (nonatomic,strong)TXTaskRequest *download2;
@end

@implementation TXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     // 设置配置方法1
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
     
     // 设置配置方法2
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
     
     // 总结：方法1和方法2具备相同设置功能,但方法2设置功能更多更齐全
     
     // 日志
     NSLog(@"-------setConfig-start-------");
     NSLog(@"requestConfig.defaultBaseURL:%@",[TXNetworkingManager manager].config.requestConfig.defaultBaseURL);
     NSLog(@"requestConfig.defaultHeaders:%@",[TXNetworkingManager manager].config.requestConfig.defaultHeaders);
     NSLog(@"requestConfig.defaultParameters:%@",[TXNetworkingManager manager].config.requestConfig.defaultParameters);
     NSLog(@"requestConfig.defaultContentTypes:%@",[TXNetworkingManager manager].config.requestConfig.defaultContentTypes);
     NSLog(@"requestConfig.defaultAPIRequestTimeoutInterval:%f",[TXNetworkingManager manager].config.requestConfig.defaultAPIRequestTimeoutInterval);
     NSLog(@"requestConfig.defaultDownloadFilePath:%@",[TXNetworkingManager manager].config.requestConfig.defaultDownloadFilePath);
     NSLog(@"deBugConfig.defaultDeBug:%d",[TXNetworkingManager manager].config.deBugConfig.defaultDeBug);
     NSLog(@"-------setConfig-end------");
     
     // API请求
     TXAPIRequest *apiRequest=[TXAPIRequest request];
     // 设置API请求方法1
     apiRequest.method=POST;
     apiRequest.url=@"APItest";
     apiRequest.baseURL=@"APItestbaseURL";
     apiRequest.parameters=@{@"testAPIParameters":@"APIParameters"};
     apiRequest.headers=@{@"testAPIHeaders":@"APIHeaders"};
     apiRequest.contentTypes=[NSSet setWithObjects:@"testAPIContentTypes", nil];
     apiRequest.timeoutInterval=50;
     
     // 设置API请求方法2
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
     .setDeBug(NO);
     
     // 总结：方法1和方法2具备相同设置功能,但方法2设置功能更多更齐全
     
     // 日志
     NSLog(@"-------apiRequest-start------");
     NSLog(@"apiRequest.method:%ld",(long)apiRequest.method);
     NSLog(@"apiRequest.url:%@",apiRequest.url);
     NSLog(@"apiRequest.baseURL:%@",apiRequest.baseURL);
     NSLog(@"apiRequest.parameters:%@",apiRequest.parameters);
     NSLog(@"apiRequest.headers:%@",apiRequest.headers);
     NSLog(@"apiRequest.contentTypes:%@",apiRequest.contentTypes);
     NSLog(@"apiRequest.timeoutInterval:%f",apiRequest.timeoutInterval);
     NSLog(@"apiRequest.deBug:%d",apiRequest.deBug);
     NSLog(@"apiRequest.deBugParameters:%@",apiRequest.deBugParameters);
     NSLog(@"-------apiRequest-end------");
     
     // Task请求
     TXTaskRequest *taskRequest=[TXTaskRequest request];
     // 设置Task请求方法1
     taskRequest.method=Download;
     taskRequest.url=@"TaskURL";
     taskRequest.baseURL=@"TaskbaseURL";
     taskRequest.parameters=@{@"testTaskParameters":@"TaskParameters"};
     taskRequest.headers=@{@"testTaskHeaders":@"TaskHeaders"};
     taskRequest.contentTypes=[NSSet setWithObjects:@"testTaskContentTypes", nil];
     taskRequest.timeoutInterval=50;
     taskRequest.downloadFilePath=@"testTaskDownloadFilePath";
     taskRequest.deBug=YES;
     
     // 设置Task请求方法2
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
     .setDeBug(YES);
     
     // 日志
     NSLog(@"-------taskRequest-start------");
     NSLog(@"taskRequest.method:%ld",(long)taskRequest.method);
     NSLog(@"taskRequest.url:%@",taskRequest.url);
     NSLog(@"taskRequest.baseURL:%@",taskRequest.baseURL);
     NSLog(@"taskRequest.parameters:%@",taskRequest.parameters);
     NSLog(@"taskRequest.headers:%@",taskRequest.headers);
     NSLog(@"taskRequest.contentTypes:%@",taskRequest.contentTypes);
     NSLog(@"taskRequest.timeoutInterval:%f",taskRequest.timeoutInterval);
     NSLog(@"taskRequest.deBug:%d",taskRequest.deBug);
     NSLog(@"taskRequest.deBugParameters:%@",taskRequest.deBugParameters);
     NSLog(@"taskRequest.downloadFilePath:%@",taskRequest.downloadFilePath);
     NSLog(@"-------taskRequest-end------");
     */
    
    // 真实数据请求
    
    UILabel *label=[[UILabel alloc]init];
    label.textColor=[UIColor blackColor];
    label.frame=CGRectMake(200, 80, 200, 20);
    label.text=@"下载1的进度";
    [self.view addSubview:label];

    UILabel *label2=[[UILabel alloc]init];
    label2.textColor=[UIColor blackColor];
    label2.frame=CGRectMake(200, 280, 200, 20);
    label2.text=@"下载2的进度";
    [self.view addSubview:label2];

    // 下载地址
    // http://vd.yinyuetai.com/hc.yinyuetai.com/uploads/videos/common/54B20169854CB6E1F651A01F84468D4A.mp4
    // http://2019.down.mankgongcha.cn:8090/android/game/daomuol.apk
    // http://2019.down.mankgongcha.cn:8090/android/soft/tagodsp.apk

    self.download1=[TXTaskRequest request]
    .setURL(@"http://vd.yinyuetai.com/hc.yinyuetai.com/uploads/videos/common/54B20169854CB6E1F651A01F84468D4A.mp4")
    .setMethod(Download)
    .setDownloadFilePath(@"/Users/xtz_pioneer/Downloads/Downloads")
    .setDownloadFileName(@"生僻字.mp4")
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
            label.text=@"下载1下载失败";
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
    });

    self.download2=[TXTaskRequest request]
    .setURL(@"http://2019.down.mankgongcha.cn:8090/android/soft/tagodsp.apk")
    .setMethod(Download)
    .setDownloadFilePath(@"/Users/xtz_pioneer/Downloads/Downloads")
    .setSuccessHandler(^ (id obj){
        // 回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            label2.text=@"下载2下载成功";
        });
        NSLog(@"下载2:filePath:%@",obj);
    })
    .setFailureHandler(^ (id obj){
        // 回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            label2.text=@"下载2下载失败";
        });
    })
    .setProgressHandler(^ (id obj){
        // 回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            NSProgress *progress=obj;
            NSInteger completed=progress.fractionCompleted*100;
            label2.text=[NSString stringWithFormat:@"下载2的进度:%ld%%",(long)completed];
        });
    })
    .setStateHandler(^ (TXTaskRequestState state){
        switch (state) {
            case TXTaskRequestStateRunning: {
                NSLog(@"下载2状态:运行");
            }
                break;
            case TXTaskRequestStatePause: {
                NSLog(@"下载2状态:暂停");
            }
                break;
            case TXTaskRequestStateCancel: {
                NSLog(@"下载2状态:取消");
            }
                break;
            case TXTaskRequestStateCompleted: {
                NSLog(@"下载2状态:完成");
            }
                break;

            default:
                break;
        }
    });

    UIButton *download1Button_start=[UIButton buttonWithType:UIButtonTypeCustom];
    [download1Button_start setTitle:@"开始下载1" forState:UIControlStateNormal];
    [download1Button_start setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    download1Button_start.frame=CGRectMake(15, 80, 100, 20);
    [download1Button_start addTarget:self action:@selector(download1Button_start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download1Button_start];

    UIButton *download1Button_pause=[UIButton buttonWithType:UIButtonTypeCustom];
    [download1Button_pause setTitle:@"暂停下载1" forState:UIControlStateNormal];
    [download1Button_pause setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    download1Button_pause.frame=CGRectMake(15, 120, 100, 20);
    [download1Button_pause addTarget:self action:@selector(download1Button_pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download1Button_pause];

    UIButton *download1Button_resume=[UIButton buttonWithType:UIButtonTypeCustom];
    [download1Button_resume setTitle:@"继续下载1" forState:UIControlStateNormal];
    [download1Button_resume setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    download1Button_resume.frame=CGRectMake(15, 160, 100, 20);
    [download1Button_resume addTarget:self action:@selector(download1Button_resume) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download1Button_resume];

    UIButton *download1Button_cancel=[UIButton buttonWithType:UIButtonTypeCustom];
    [download1Button_cancel setTitle:@"取消下载1" forState:UIControlStateNormal];
    [download1Button_cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    download1Button_cancel.frame=CGRectMake(15, 200, 100, 20);
    [download1Button_cancel addTarget:self action:@selector(download1Button_cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download1Button_cancel];

    UIButton *download2Button_start=[UIButton buttonWithType:UIButtonTypeCustom];
    [download2Button_start setTitle:@"开始下载2" forState:UIControlStateNormal];
    [download2Button_start setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    download2Button_start.frame=CGRectMake(15, 280, 100, 20);
    [download2Button_start addTarget:self action:@selector(download2Button_start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download2Button_start];

    UIButton *download2Button_pause=[UIButton buttonWithType:UIButtonTypeCustom];
    [download2Button_pause setTitle:@"暂停下载2" forState:UIControlStateNormal];
    [download2Button_pause setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    download2Button_pause.frame=CGRectMake(15, 320, 100, 20);
    [download2Button_pause addTarget:self action:@selector(download2Button_pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download2Button_pause];

    UIButton *download2Button_resume=[UIButton buttonWithType:UIButtonTypeCustom];
    [download2Button_resume setTitle:@"继续下载2" forState:UIControlStateNormal];
    [download2Button_resume setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    download2Button_resume.frame=CGRectMake(15, 360, 100, 20);
    [download2Button_resume addTarget:self action:@selector(download2Button_resume) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download2Button_resume];

    UIButton *download2Button_cancel=[UIButton buttonWithType:UIButtonTypeCustom];
    [download2Button_cancel setTitle:@"取消下载2" forState:UIControlStateNormal];
    [download2Button_cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    download2Button_cancel.frame=CGRectMake(15, 400, 100, 20);
    [download2Button_cancel addTarget:self action:@selector(download2Button_cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download2Button_cancel];


    UIButton *button_cancelAllTasks=[UIButton buttonWithType:UIButtonTypeCustom];
    [button_cancelAllTasks setTitle:@"取消全部任务" forState:UIControlStateNormal];
    [button_cancelAllTasks setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button_cancelAllTasks.frame=CGRectMake(15, 440, 120, 20);
    [button_cancelAllTasks addTarget:self action:@selector(button_cancelAllTasks) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_cancelAllTasks];
    
	// Do any additional setup after loading the view, typically from a nib.
}

/** 开始下载1 */
- (void)download1Button_start {
    self.download1.start();
}

/** 暂停下载1 */
- (void)download1Button_pause {
    self.download1.pause();
}

/** 继续下载1 */
- (void)download1Button_resume {
    self.download1.resume();
}

/** 取消下载1 */
- (void)download1Button_cancel {
    self.download1.cancel();
}

/** 开始下载2 */
- (void)download2Button_start {
    self.download2.start();
}

/** 暂停下载2 */
- (void)download2Button_pause {
    self.download2.pause();
}

/** 继续下载2 */
- (void)download2Button_resume {
    self.download2.resume();
}

/** 取消下载2 */
- (void)download2Button_cancel {
    self.download2.cancel();
}

/** 取消全部任务 */
- (void)button_cancelAllTasks {
    [TXNetworkingManager cancelAllTasks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
