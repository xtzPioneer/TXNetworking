//
//  TXNetworkingManager+TXNetworkMonitoringManager.h
//  AFNetworking
//
//  Created by xtz_pioneer on 2019/5/27.
//

#import "TXNetworkingManager.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  网络检测
 */
@interface TXNetworkingManager (TXNetworkMonitoringManager)

/**
 *  是否开启网络监控
 */
@property (nonatomic,assign)BOOL startNetworkMonitoring;

/**
 *  网络可达性状态
 */
@property (nonatomic,assign,readonly)TXNetworkReachabilityState networkReachabilityState;

/**
 *  网络可达性状态状态回调
 */
@property (nonatomic,copy)TXNetworkReachabilityStateHandler networkReachabilityStateHandler;

/**
 *  设置开启网络监控
 */
- (TXNetworkingManager *(^)(BOOL startNetworkMonitoring))setStartNetworkMonitoring;

/**
 *  设置网络可达性状态状态回调
 */
- (TXNetworkingManager *(^)(TXNetworkReachabilityStateHandler _Nullable))setNetworkReachabilityStateHandler;

@end

NS_ASSUME_NONNULL_END
