//
//  ZdlCustomCell.m
//  小米助手
//
//  Created by CC&DD on 14-3-19.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "ZdlCustomCell.h"

@implementation ZdlCustomCell

- (void)dealloc
{
    [_time release];
    [_typical release];
    [_iconImage release];
    [_wOrLo release];
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initSubView];
    }
    return self;
}
- (void)initSubView
{
    _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
    [self.contentView addSubview:_iconImage];
    _typical = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 70, 30)];
    [_typical setTextColor:[UIColor blackColor]];
    [_typical setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:_typical];
    
    _wOrLo = [[UILabel alloc] initWithFrame:CGRectMake(150, 5, 50, 30)];
    [_wOrLo setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:_wOrLo];
    
    _time = [[UILabel alloc] initWithFrame:CGRectMake(210, 5, 90, 30)];
    [_time setTextColor:[UIColor blackColor]];
    [_time setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:_time];

}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
