//
//  DataStationView.m
//  小米助手
//
//  Created by CC&DD on 14-3-20.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DataStationView.h"

@implementation DataStationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
+ (DataStationView *)initDataStationView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DetailStationView" owner:self options:nil] firstObject];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
