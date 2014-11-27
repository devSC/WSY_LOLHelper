//
//  BaseCell.m
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 
#pragma mark subclass method
+ (CGFloat)cellHeightForModel:(BaseModel *)dateForCell
{
    return 0.0f;
}


@end
