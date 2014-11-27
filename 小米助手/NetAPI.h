//
//  NetAPI.h
//  小米助手
//
//  Created by CC&DD on 14-3-15.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetAPI : NSObject

/*---------------
 *第一个页面获取召唤师资料
 *----------------*/
+ (NSString *)stingWithName: (NSString *)nameString serverString: (NSString *)serverString;

/*----------------
 *返回战绩列表url
 *---------------*/
+ (NSURL *)getRecentGameListWithName: (NSString *)nameString server: (NSString *)serverString;
/*----------------
 *返回战绩列表url
 *---------------*/

@end
