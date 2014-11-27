//
//  VideoCell.h
//  TestMyCellF
//
//  Created by CC&DD on 14-3-25.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseCell.h"

@class MarqueeLabel;
@interface VideoCell : BaseCell

@property (nonatomic, retain) UIImageView *videoImageView;
@property (nonatomic, retain) MarqueeLabel *videoNameLabel;
@property (nonatomic, retain) UILabel *playCountLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *upDateTime;

@end
