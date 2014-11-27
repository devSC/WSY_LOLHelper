//
//  GoodsImageButton.m
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "GoodsImageButton.h"

@implementation GoodsImageButton

- (void)dealloc
{
    [_iconImage release];
    [_nameLabel release];
    [_goodsId release];
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width - 10, self.frame.size.height - 10)];
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(-4, 63, 64, 12)];
        [_nameLabel setFont:[UIFont systemFontOfSize:11]];
        [_nameLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_iconImage];
        [self addSubview:_nameLabel];
    }
    return self;
}


@end
