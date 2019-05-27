//
//  TXNetworkingConst.h
//  Pods
//
//  Created by xtz_pioneer on 2019/5/21.
//

#ifndef TXNetworkingConst_h
#define TXNetworkingConst_h

/**
 *  AFMultipartFormData
 */
@protocol AFMultipartFormData;

/**
 *  API请求类型
 */
typedef NS_ENUM(NSInteger,TXAPIRequestMethodType) {
    /** GET请求 */
    GET    = 10,
    /** POST请求 */
    POST   = 11,
    /** PUT请求 */
    PUT    = 12,
    /** PATCH请求 */
    PATCH  = 13,
    /** DELETE请求 */
    DELETE = 14,
    /** HEAD请求 */
    HEAD   = 15,
};

/**
 *  API请求类型
 */
typedef NS_ENUM(NSInteger,TXTaskRequestMethodType) {
    /** 上传 */
    Upload   = 110,
    /** 下载 */
    Download = 111,
};

/**
 *  API请求状态
 */
typedef NS_ENUM(NSInteger,TXAPIRequestState) {
    /** 运行 */
    TXAPIRequestStateRunning   = 0,
    /** 取消 */
    TXAPIRequestStateCancel    = 1,
    /** 完成 */
    TXAPIRequestStateCompleted = 2,
};

/**
 *  任务请求状态
 */
typedef NS_ENUM(NSInteger,TXTaskRequestState) {
    /** 运行 */
    TXTaskRequestStateRunning   = 0,
    /** 暂停 */
    TXTaskRequestStatePause     = 1,
    /** 取消 */
    TXTaskRequestStateCancel    = 2,
    /** 完成 */
    TXTaskRequestStateCompleted = 3,
};

/**
 *  网络可达性状态
 */
typedef NS_ENUM(NSInteger,TXNetworkReachabilityState) {
    /** 未识别的网络 */
    TXNetworkReachabilityStateUnknown          = -1,
    /** 不可达的网络(未连接) */
    TXNetworkReachabilityStateNotReachable     = 0,
    /** 2G,3G,4G...的网络 */
    TXNetworkReachabilityStateReachableViaWWAN = 1,
    /** Wi-Fi的网络 */
    TXNetworkReachabilityStateReachableViaWiFi = 2,
};

/**
 *  请求结果回调
 */
typedef void (^TXSuccessHandler) (id _Nullable obj);

/**
 *  请求失败回调
 */
typedef void (^TXFailureHandler) (id _Nullable error);

/**
 *  请求进度回调
 */
typedef void (^TXProgressHandler) (id _Nullable progress);

/**
 *  格式回调
 */
typedef id _Nullable (^TXFormatHandler) (id _Nullable obj);

/**
 *  FormData回调
 */
typedef void(^TXAFMultipartFormDataHandler)(id<AFMultipartFormData> _Nullable formData);

/**
 *  DeBug
 */
typedef void(^TXDeBugHandler)(NSDictionary<NSString *, NSObject *> * _Nullable deBugParameters);

/**
 *  API请求状态回调
 */
typedef void (^TXAPIRequestStateHandler) (TXAPIRequestState state);

/**
 *  任务请求状态回调
 */
typedef void (^TXTaskRequestStateHandler) (TXTaskRequestState state);

/**
 *  网络可达性状态状态回调
 */
typedef void (^TXNetworkReachabilityStateHandler) (TXNetworkReachabilityState state);

#endif /* TXNetworkingConst_h */
