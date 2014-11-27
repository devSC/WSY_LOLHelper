//
//  UIImageButton.m
//  igridviewdemo
//
//  Created by vincent_guo on 13-12-12.
//  Copyright (c) 2013年 vincent_guo. All rights reserved.
//

#import "UIImageButton.h"

@implementation UIImageButton

- (void)dealloc
{
    [_iconImage release];
    [_title release];
    [_nameLabel release];
    [_heroId release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
        _title = [[UILabel alloc] initWithFrame:CGRectMake(-5, 67, 75, 20)];
        [_title setFont:[UIFont systemFontOfSize:14]];
        [_title setTextAlignment:NSTextAlignmentCenter];
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(-4, 87, 74, 12)];
        [_nameLabel setFont:[UIFont systemFontOfSize:11]];
        [_nameLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_iconImage];
        [self addSubview:_title];
        [self addSubview:_nameLabel];
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
