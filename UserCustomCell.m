//
//  UserCustomCell.m
//  小米助手
//
//  Created by CC&DD on 14-3-18.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "UserCustomCell.h"

@implementation UserCustomCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_typical release];
    [_userW release];
    [_userLo release];
    [_userOdds release];
    [_rankAndTier release];
    [super dealloc];
}
@end
