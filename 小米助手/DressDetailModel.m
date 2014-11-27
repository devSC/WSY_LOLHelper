//
//  DressDetailModel.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DressDetailModel.h"

@implementation DressDetailModel
- (void)dealloc
{
    [_nameString release];
    [_imageArray release];
    [_lowString release];
    
    [super dealloc];
}
- (id)initWithNameString:(NSString *)name lowString:(NSString *)lowString imageArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        [self setNameString:name];
        [self setLowString:lowString];
        [self setImageArray:array];
    }
    return self;
}

+ (id)dressDetailModelWithNameString:(NSString *)name lowString:(NSString *)lowString imageArray:(NSArray *)array
{
    DressDetailModel *dressModel = [[DressDetailModel alloc] initWithNameString:name lowString:lowString imageArray:array];
    return [dressModel autorelease];
}

@end
