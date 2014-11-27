//
//  UserInfo2.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-25.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "UserInfo2.h"


@implementation UserInfo2
- (void)dealloc
{
    [_backGroundString release];
    [_analyseString release];
    [super dealloc];
}
- (id)initWithAnalyseString:(NSString *)astring BackGroundString:(NSString *)bstring
{
    self = [super init];
    if (self) {
        [self setAnalyseString:astring];
        [self setBackGroundString:bstring];
    }
    return self;
}

+ (id)userInfo2WithAnalyseString:(NSString *)astring BackGroundString:(NSString *)bstring
{
    UserInfo2 *userInfo = [[UserInfo2 alloc] initWithAnalyseString:astring BackGroundString:bstring];
    return [userInfo autorelease];
}
@end
