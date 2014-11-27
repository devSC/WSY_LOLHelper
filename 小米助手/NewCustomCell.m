//
//  NewCustomCell.m
//  小米助手
//
//  Created by CC&DD on 14-3-30.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "NewCustomCell.h"
#import "UIImageView+WebCache.h"

@implementation NewCustomCell

- (void)dealloc
{
    [_photo release];
    [_contentLabel release];
    [_titleLabel release];
    [_dic release];
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initWithSubview];
        
    }
    return self;
}

- (void)initWithSubview
{
    _photo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 80, 60)];
    [self.contentView addSubview:_photo];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 210, 20)];
    [_titleLabel setTextAlignment:NSTextAlignmentLeft];
    [_titleLabel setFont:[UIFont systemFontOfSize:kFontSize + 2]];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 25, 210, 40)];
    [_contentLabel setTextAlignment:NSTextAlignmentLeft];
    [_contentLabel setFont:[UIFont systemFontOfSize:kFontSize-1.5f]];
    [_contentLabel setTextColor:[UIColor blackColor]];
    [_contentLabel setNumberOfLines:2];
    [self.contentView addSubview:_contentLabel];
    
    _readCount = [[UILabel alloc] initWithFrame:CGRectMake(240, 45, 210, 20)];
    [_readCount setTextAlignment:NSTextAlignmentRight];
    [_readCount setFont:[UIFont systemFontOfSize:kFontSize-1.5f]];
    [_readCount setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_readCount];
    
    
}
- (void)setDic:(NSDictionary *)dic
{
    if (_dic != dic) {
        [_dic release];
        _dic = [dic retain];
        [self loadData];
    }

}

- (void)loadData
{
    [_photo setImageWithURL:[NSURL URLWithString:[_dic objectForKey:@"photo"]]];
    [_titleLabel setText:[_dic objectForKey:@"title"]];
    [_contentLabel setText:[_dic objectForKey:@"content"]];
    NSString *string = [NSString stringWithFormat:@"%@", [_dic objectForKey:@"readCount"]];
    NSString *readCountString = [string stringByAppendingString:@"  阅读"];
    [_readCount setText:readCountString];
    
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
