//
//  DetailViewCell.m
//  小米助手
//
//  Created by CC&DD on 14-3-20.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DetailViewCell.h"

@implementation DetailViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _bigImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 280, 80)];
        [self.contentView addSubview:_bigImageView];
        _listImageView = [[UIImageView alloc] initWithFrame:CGRectMake(130, 15, 40, 40)];;
        [self.contentView addSubview:_listImageView];
        _listName = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, 160, 15)];
        [_listName setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:_listName];
    }
    return self;
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
- (void)dealloc {
    [_listName release];
    [_listImageView release];
    [_bigImageView release];
    [super dealloc];
}

@end
