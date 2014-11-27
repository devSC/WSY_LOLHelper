//
//  RuneCell.m
//  小米助手
//
//  Created by CC&DD on 14-3-29.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "RuneCell.h"
#import "RuneMode.h"
#import "UIImageView+WebCache.h"
#define kFontSize 13

@implementation RuneCell

- (void)dealloc
{
    [_iconImge release];
    [_nameLabel release];
    [_descLabel release];
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initSubview];
    }
    return self;

}

- (void)initSubview
{
    _iconImge = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 44, 44)];
    [self.contentView addSubview:_iconImge];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 200, 25)];
    [_nameLabel setFont:[UIFont systemFontOfSize:kFontSize + 2]];
    [_nameLabel setTextColor:[UIColor blackColor]];
    [_nameLabel setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:_nameLabel];
    
    _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 250, 19)];
    [_descLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    [_descLabel setTextColor:[UIColor grayColor]];
    [_descLabel setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:_descLabel];
    
    CGRect frame = [self frame];
    frame.size.height = 54.0f;
    self.frame = frame;
}

- (void)setDateForCell:(BaseModel *)dateForCell
{
    RuneMode *model = (RuneMode *)dateForCell;
    [_nameLabel setText:model.nameString];
    [_descLabel setText:model.descString];
    [_iconImge setImageWithURL:[NSURL URLWithString:model.iconUrlString]];
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
