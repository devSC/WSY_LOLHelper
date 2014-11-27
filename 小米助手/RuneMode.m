//
//  RuneMode.m
//  小米助手
//
//  Created by CC&DD on 14-3-29.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "RuneMode.h"

@implementation RuneMode

- (void)dealloc
{
    [_iconUrlString release];
    [_nameString release];
    [_descString release];
    
    [super dealloc];
}
- (id)initRuneModelWithIconUrlString: (NSString *)iconString
                          nameString: (NSString *)nameString
                          decrString: (NSString *)decrString
{
    if (self = [super init]) {
        [self setIconUrlString:iconString];
        [self setNameString:nameString];
        [self setDescString:decrString];
    }
    return self;
}
+ (id)RuneModelWithIconUrlString: (NSString *)iconString
                      nameString: (NSString *)nameString
                      decrString: (NSString *)decrString{
    RuneMode *model = [[RuneMode alloc] initRuneModelWithIconUrlString:iconString nameString:nameString decrString:decrString];
    return [model autorelease];
}

@end
