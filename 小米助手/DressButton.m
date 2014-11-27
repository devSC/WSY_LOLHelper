//
//  DressButton.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DressButton.h"

@implementation DressButton

- (void)dealloc
{
    [_iconImageView release];
    [_iconString release];
    
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 45, 45)];
        [self addSubview:_iconImageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
