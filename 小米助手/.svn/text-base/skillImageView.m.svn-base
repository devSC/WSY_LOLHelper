//
//  skillImageView.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "skillImageView.h"

@implementation skillImageView

- (void)dealloc
{
    [_label release];
    [_skillImage release];
    
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        
        _skillImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
        [self addSubview:_skillImage];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 15, 15)];
        [view setBackgroundColor:[UIColor blackColor]];
        [view setAlpha:0.3f];
        [self addSubview:view];
        [view release];
        
         _label = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 15, 15)];
        [_label setFont:[UIFont systemFontOfSize:15]];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [_label setTextColor:[UIColor whiteColor]];
        [self addSubview:_label];
        
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
