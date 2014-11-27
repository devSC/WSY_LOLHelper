//
//  ZdlView.m
//  小米助手
//
//  Created by CC&DD on 14-3-19.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "ZdlView.h"
//#import "ZdlCustomCell.h"
#import "WebViewController.h"
#import "UIImageView+WebCache.h"

@implementation ZdlView

- (void)dealloc {
    [_tableView release];

    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        /*--------
        *----出Bug处
        ----------*/
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 215)];
        [self addSubview:_tableView];

    }
    return self;
}



@end
