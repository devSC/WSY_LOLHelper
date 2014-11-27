//
//  VideoCell.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-25.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "VideoCell.h"
#import "VideoModel.h"
#import "MarqueeLabel.h"
#define kFontSize 11
#define kX 35

@implementation VideoCell

- (void)dealloc
{
    [_videoImageView release];
    [_videoNameLabel release];
    [_playCountLabel release];
    [_timeLabel release];
    [_upDateTime release];
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        [self initSubView];
        

    }
    return self;
}

- (void)initSubView
{
    _videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 34, 34)];
    [self addSubview:_videoImageView];
    [_videoImageView setImage:[UIImage imageNamed:@"background_logo@2x"]];
    
    _videoNameLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(45, 5, 265, 20) duration:1 andFadeLength:2.0f];
    [_videoNameLabel setTextColor:[UIColor blackColor]];
    [_videoNameLabel setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:_videoNameLabel];
    _videoNameLabel.numberOfLines = 1;
    _videoNameLabel.opaque = NO;
    _videoNameLabel.enabled = YES;
    _videoNameLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    _videoNameLabel.textAlignment = NSTextAlignmentCenter;
    _videoNameLabel.textColor = [UIColor colorWithRed:0.234 green:0.234 blue:0.234 alpha:1.000];
    _videoNameLabel.backgroundColor = [UIColor clearColor];
    
    
    UILabel *countName = [[UILabel alloc] initWithFrame:CGRectMake(45, 27, 60, 12)];
    [countName setTextColor:[UIColor grayColor]];
    [countName setFont:[UIFont systemFontOfSize:kFontSize]];
    [countName setText:@"播放次数:"];
    [self.contentView addSubview:countName];
    [countName release];
    
    _playCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(95, 27, 40, 12)];
    [_playCountLabel setTextColor:[UIColor grayColor]];
    [_playCountLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:_playCountLabel];
    
    UILabel *timeName = [[UILabel alloc] initWithFrame:CGRectMake(145, 27, 30, 12)];
    [timeName setTextColor:[UIColor grayColor]];
    [timeName setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:timeName];
    [timeName setText:@"评分:"];
    [timeName release];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 27, 50, 12)];
    [_timeLabel setTextColor:[UIColor grayColor]];
    [_timeLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:_timeLabel];
    
    UILabel *upDateName = [[UILabel alloc] initWithFrame:CGRectMake(220, 27, 50, 12)];
    [upDateName setTextColor:[UIColor grayColor]];
    [upDateName setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:upDateName];
    [upDateName setText:@"上传时间:"];
    [upDateName release];
    
    _upDateTime = [[UILabel alloc] initWithFrame:CGRectMake(270, 27, 40, 12)];
    [_upDateTime setTextColor:[UIColor grayColor]];
    [_upDateTime setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:_upDateTime];

}

- (void)setDateForCell:(BaseModel *)dateForCell
{
    [super setDateForCell:dateForCell];
    VideoModel *videoModel = (VideoModel *)dateForCell;
    [_videoNameLabel setText:videoModel.videoNameString];
    [_playCountLabel setText:videoModel.playCountString];
    [_timeLabel setText:videoModel.timeString];
    [_upDateTime setText:videoModel.upDateTimeString];
}


@end
