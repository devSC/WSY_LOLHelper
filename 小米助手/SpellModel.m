//
//  SpellModel.m
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "SpellModel.h"

@implementation SpellModel

- (id)initSpellModelWithTitleString:(NSString *)titleString contentString:(NSString *)contentString
{
    self = [super init];
    if (self) {
        [self setTitleString:titleString];
        [self setContentString:contentString];
    }
    return self;
}

+ (id)spellModelWithTitleString:(NSString *)titleString contentString:(NSString *)contentString
{
    SpellModel *model = [[SpellModel alloc] initSpellModelWithTitleString:titleString contentString:contentString];
    return [model autorelease];
}
@end
