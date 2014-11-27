//
//  TopView.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "TopView.h"


@implementation TopView

- (void)dealloc
{
    [_nameLabel release];
    [_urlString release];
    [_topImageView release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [self setBackgroundColor:[UIColor blueColor]];
        [self initSubView];
    }
    return self;
}
- (void)initSubView
{
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [self addSubview:_topImageView];
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_backButton setFrame:CGRectMake(10, 25, 44, 44)];
    [self addSubview:_backButton];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 300, 44)];
    [_nameLabel setText:@"出装详情"];
    [_nameLabel setFont:[UIFont fontWithName:@"Chalkboard SE Regular" size:20]];
    [_nameLabel setTextColor:[UIColor whiteColor]];
    [_nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_nameLabel];
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
