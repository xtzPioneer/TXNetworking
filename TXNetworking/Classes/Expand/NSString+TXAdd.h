//
//  NSString+TXAdd.h
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * NSString
 */
@interface NSString (TXAdd)

/**
 *  哈希值
 *
 *  @param obj 对象
 *
 *  @return NSString 哈希值
 */
+ (NSString * _Nonnull)hashWithObject:(id _Nonnull)obj;

/**
 *  移除冗余
 *
 *  @return NSString 移除冗余后的字符串
 */
- (NSString *)removeRedundancy;

/**
 *  拼接字符串
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *
 *  @return 拼接后的字符串;
 */
+ (NSString * _Nonnull)appendingStringWithString1:(NSString * _Nonnull)string1 string2:(NSString * _Nonnull)string2;

@end

NS_ASSUME_NONNULL_END
