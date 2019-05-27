//
//  TXNetworkingManager+TXNetworkMonitoringManager.m
//  AFNetworking
//
//  Created by xtz_pioneer on 2019/5/27.
//

#import "TXNetworkingManager+TXNetworkMonitoringManager.h"
#import <objc/runtime.h>

/** 是否开启网络监控 */
NSString *const startNetworkMonitoringKey=@"startNetworkMonitoring";

/** 网络可达性状态 */
NSString *const networkReachabilityStateKey=@"networkReachabilityState";

/** 网络可达性状态状态回调 */
NSString *const networkReachabilityStateHandlerKey=@"networkReachabilityStateHandler";

@implementation TXNetworkingManager (TXNetworkMonitoringManager)

/** 设置是否开启网络监控 */
- (void)setStartNetworkMonitoring:(BOOL)startNetworkMonitoring {
    objc_setAssociatedObject(self, &startNetworkMonitoringKey,[NSNumber numberWithBool:startNetworkMonitoring], OBJC_ASSOCIATION_ASSIGN);
    AFNetworkReachabilityManager *networkReachabilityManager=[AFNetworkReachabilityManager sharedManager];
    if (startNetworkMonitoring) {
        [networkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown: {
                    [TXNetworkingManager manager].networkReachabilityState=TXNetworkReachabilityStateUnknown;
                    if ([TXNetworkingManager manager].networkReachabilityStateHandler) [TXNetworkingManager manager].networkReachabilityStateHandler (TXNetworkReachabilityStateUnknown);
                }
                    break;
                case AFNetworkReachabilityStatusNotReachable: {
                    [TXNetworkingManager manager].networkReachabilityState=TXNetworkReachabilityStateNotReachable;
                    if ([TXNetworkingManager manager].networkReachabilityStateHandler) [TXNetworkingManager manager].networkReachabilityStateHandler (TXNetworkReachabilityStateNotReachable);
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN: {
                    [TXNetworkingManager manager].networkReachabilityState=TXNetworkReachabilityStateReachableViaWWAN;
                    if ([TXNetworkingManager manager].networkReachabilityStateHandler) [TXNetworkingManager manager].networkReachabilityStateHandler (TXNetworkReachabilityStateReachableViaWWAN);
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi: {
                    [TXNetworkingManager manager].networkReachabilityState=TXNetworkReachabilityStateReachableViaWiFi;
                    if ([TXNetworkingManager manager].networkReachabilityStateHandler) [TXNetworkingManager manager].networkReachabilityStateHandler (TXNetworkReachabilityStateReachableViaWiFi);
                }
                    break;
                default:
                    break;
            }
        }];
        [networkReachabilityManager startMonitoring];
    }else{
        [networkReachabilityManager stopMonitoring];
    }
}

/** 获取是否开启网络监控 */
- (BOOL)startNetworkMonitoring {
    return [objc_getAssociatedObject(self, &startNetworkMonitoringKey) boolValue];
}

/** 设置网络可达性状态 */
- (void)setNetworkReachabilityState:(TXNetworkReachabilityState)networkReachabilityState{
    objc_setAssociatedObject(self, &networkReachabilityStateKey,[NSNumber numberWithInteger:networkReachabilityState], OBJC_ASSOCIATION_ASSIGN);
}

/** 获取网络可达性状态 */
- (TXNetworkReachabilityState)networkReachabilityState {
    return [objc_getAssociatedObject(self, &networkReachabilityStateKey) integerValue];
}

/** 设置网络可达性状态状态回调 */
- (void)setNetworkReachabilityStateHandler:(TXNetworkReachabilityStateHandler)networkReachabilityStateHandler{
    objc_setAssociatedObject(self, &networkReachabilityStateHandlerKey,networkReachabilityStateHandler, OBJC_ASSOCIATION_COPY);
}

/** 获取网络可达性状态状态回调 */
- (TXNetworkReachabilityStateHandler)networkReachabilityStateHandler{
    return objc_getAssociatedObject(self, &networkReachabilityStateHandlerKey);
}

/**
 *  设置开启网络监控
 */
- (TXNetworkingManager *(^)(BOOL startNetworkMonitoring))setStartNetworkMonitoring {
    return ^TXNetworkingManager * (BOOL startNetworkMonitoring) {
        self.startNetworkMonitoring=startNetworkMonitoring;
        return self;
    };
}

/**
 *  设置网络可达性状态状态回调
 */
- (TXNetworkingManager *(^)(TXNetworkReachabilityStateHandler _Nullable))setNetworkReachabilityStateHandler {
    return ^TXNetworkingManager* (TXNetworkReachabilityStateHandler _Nullable networkReachabilityStateHandler) {
        self.networkReachabilityStateHandler=networkReachabilityStateHandler;
        return self;
    };
}

@end
