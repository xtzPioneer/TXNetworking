//
//  NSString+TXAdd.m
//  TXNetworking
//
//  Created by xtz_pioneer on 2019/5/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "NSString+TXAdd.h"

@implementation NSString (TXAdd)

/**
 *  哈希值
 *
 *  @param obj 对象
 *
 *  @return NSString 哈希值
 */
+ (NSString * _Nonnull)hashWithObject:(id _Nonnull)obj {
    NSString *aHash=[NSString stringWithFormat:@"%lu",(unsigned long)[obj hash]];
    aHash=[NSString stringWithFormat:@"TX%@",aHash];
    aHash=[NSString stringWithFormat:@"%lu",(unsigned long)[aHash hash]];
    return aHash;
}

/**
 *  移除冗余
 *
 *  @return NSString 移除冗余后的字符串
 */
- (NSString *)removeRedundancy {
    NSString *aString=[self stringByReplacingOccurrencesOfString:@" " withString:@""];
    aString=[aString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    aString=[aString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return aString;
}

/**
 *  拼接字符串
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *
 *  @return 拼接后的字符串;
 */
+ (NSString * _Nonnull)appendingStringWithString1:(NSString * _Nonnull)string1 string2:(NSString * _Nonnull)string2{
    string1=string1 && string1.length>0 ? string1 : @"";
    string2=string2 && string2.length>0 ? string2 : @"";
    return [[NSString stringWithFormat:@"%@%@",string1,string2] removeRedundancy];
}

@end
