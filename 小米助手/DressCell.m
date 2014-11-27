//
//  DressCell.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DressCell.h"
#import "DressModel.h"
#import "DressButton.h"
#import "UIImageView+WebCache.h"
#import "NetApi.h"

#define kFontSize 13


@implementation DressCell

- (void)dealloc
{
    [_combatLabel release];
    [_nameLabel release];
    [_authorLabel release];
    [_timeLabel release];
    [_imageArray release];
    
    
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
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 220, 20)];
    [_nameLabel setTextColor:[UIColor blackColor]];
    [_nameLabel setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 0, 90, 20)];
    [_timeLabel setTextColor:[UIColor blackColor]];
    [_timeLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    [_timeLabel setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:_timeLabel];
    
    UILabel *authorName = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 40, 15)];
    [authorName setTextColor:[UIColor grayColor]];
    [authorName setText:@"作者:"];
    [authorName setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:authorName];
    [authorName release];
    
    _authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, 150, 15)];
    [_authorLabel setTextColor:[UIColor grayColor]];
    [_authorLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:_authorLabel];
    
    UILabel *combatName = [[UILabel alloc] initWithFrame:CGRectMake(210, 20, 50, 15)];
    [combatName setTextColor:[UIColor grayColor]];
    [combatName setText:@"战斗力:"];
    [combatName setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:combatName];
    [combatName release];
    
    _combatLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 20, 50, 15)];
    [_combatLabel setTextColor:[UIColor orangeColor]];
    [_combatLabel setTextAlignment:NSTextAlignmentRight];
    [_combatLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:_combatLabel];
  
    
    _imageButton1 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton1 setFrame:CGRectMake(10, 35, 50, 50)];
    [self.contentView addSubview:_imageButton1];
//    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    _imageButton2 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton2 setFrame:CGRectMake(60, 35, 50, 50)];
    [self.contentView addSubview:_imageButton2];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    _imageButton3 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton3 setFrame:CGRectMake(110, 35, 50, 50)];
    [self.contentView addSubview:_imageButton3];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    _imageButton4 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton4 setFrame:CGRectMake(160, 35, 50, 50)];
    [self.contentView addSubview:_imageButton4];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    _imageButton5 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton5 setFrame:CGRectMake(210, 35, 50, 50)];
    [self.contentView addSubview:_imageButton5];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    _imageButton6 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton6 setFrame:CGRectMake(260, 35, 50, 50)];
    [self.contentView addSubview:_imageButton6];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_imageButton1 setUserInteractionEnabled:NO];
    [_imageButton2 setUserInteractionEnabled:NO];
    [_imageButton3 setUserInteractionEnabled:NO];
    [_imageButton4 setUserInteractionEnabled:NO];
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
    
    CGRect frame = [self frame];
    frame.size.height = 90;
    self.frame = frame;
}

- (void)setDateForCell:(BaseModel *)dateForCell
{
    [super setDateForCell:dateForCell];
    DressModel *dressModel = (DressModel *)dateForCell;
    [_nameLabel setText:dressModel.nameString];
    [_timeLabel setText:dressModel.timeString];
    [_authorLabel setText:dressModel.authorString];
    [_combatLabel setText:dressModel.combatString];
    [self setImageArray:dressModel.imageArray];
}

- (void)setImageArray:(NSArray *)imageArray
{
    if (_imageArray != imageArray) {
        [_imageArray release];
        _imageArray = [imageArray retain];
        [self loadImageToButton];
    }

}

- (void)loadImageToButton
{
    NSString *icon1 = [_imageArray objectAtIndex:0];
    NSString *icon2 = [_imageArray objectAtIndex:1];
    NSString *icon3 = _imageArray[2];
    NSString *icon4 = _imageArray[3];
    NSString *icon5 = _imageArray[4];
    NSString *icon6 = _imageArray[5];
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon1]]];
    _imageButton1.iconString = icon1;
    
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon2]]];
    _imageButton2.iconString = icon2;
    
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon3]]];
    _imageButton3.iconString = icon3;
    
    [_imageButton4.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon4]]];
    _imageButton4.iconString = icon4;
    
    [_imageButton5.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon5]]];
    _imageButton5.iconString = icon5;
    
    [_imageButton6.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon6]]];
    _imageButton6.iconString = icon6;

}
@end
