//
//  SpellCell.m
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "SpellCell.h"
#import "SpellModel.h"

#define kFontSize 13

@implementation SpellCell

- (void)dealloc
{
    [_titleLabel release];
    [_contentLabel release];
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        [self initSubview];
    }
    return self;
}
- (void)initSubview
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 20)];
    [_titleLabel setTextAlignment:NSTextAlignmentLeft];
    [_titleLabel setFont:[UIFont systemFontOfSize:kFontSize + 2]];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 300, 20)];
    [_contentLabel setTextAlignment:NSTextAlignmentLeft];
    [_contentLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    [_contentLabel setTextColor:[UIColor orangeColor]];
    [self.contentView addSubview:_contentLabel];

}
- (void)setDateForCell:(BaseModel *)dateForCell
{
//    [super setDateForCell:dateForCell];
    SpellModel *model = (SpellModel *)dateForCell;
    [_titleLabel setText:model.titleString];
    [self setcontentLabelWithString:model.contentString];
}

- (void)setcontentLabelWithString: (NSString *)string
{
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.contentLabel.text = string;
    //设置label的最大行数
    self.contentLabel.numberOfLines = 10;
    CGSize size = CGSizeMake(300, 1000);
    CGSize labelSize = [self.contentLabel.text sizeWithFont:self.contentLabel.font
                                      constrainedToSize:size
                                          lineBreakMode:NSLineBreakByClipping];
    self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y, labelSize.width, labelSize.height);
    //计算出自适应的高度
    frame.size.height = labelSize.height + 20 + 10;
    self.frame = frame;

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
