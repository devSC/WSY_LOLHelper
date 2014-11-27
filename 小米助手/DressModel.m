//
//  DressModel.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DressModel.h"

@implementation DressModel


- (void)dealloc
{
    [_nameString release];
    [_authorString release];
    [_imageArray release];
    [_combatString release];
    [_timeString release];
    
    [super dealloc];
}
- (id)initWithNameString:(NSString *)name timeString:(NSString *)time authorString:(NSString *)author combatString:(NSString *)combatString imageArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        [self setNameString:name];
        [self setTimeString:time];
        [self setAuthorString:author];
        [self setCombatString:combatString];
        [self setImageArray:array];
    }
    return self;
}

+ (id)dressModelWithNameString:(NSString *)name timeString:(NSString *)time authorString:(NSString *)author combatString:(NSString *)combatString imageArray:(NSArray *)array
{
    DressModel *dressModel = [[DressModel alloc] initWithNameString:name timeString:time authorString:author combatString:combatString imageArray:array];
    return [dressModel autorelease];
}

@end
