//
//  VideoModel.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-25.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

- (void)dealloc
{
    [_videoNameString release];
    [_playCountString release];
    [_timeString release];
    [_upDateTimeString release];
    [_urlString release];
    [super dealloc];
}

- (id)initWithVideoNameString: (NSString *)videoName
                   playCountString: (NSString *)playCount
                        timeString: (NSString *)time
                  upDataTimeString: (NSString *)upDataTime
                         urlString: (NSString *)urlString

{
    self = [super init];
    if (self) {
        [self setVideoNameString:videoName];
        [self setPlayCountString:playCount];
        [self setTimeString:time];
        [self setUpDateTimeString:upDataTime];
        [self setUrlString:urlString];
    }
    return self;
}
+ (id)videoModelWithVideoNameString: (NSString *)videoName
                         playCountString: (NSString *)playCount
                              timeString: (NSString *)time
                        upDataTimeString: (NSString *)upDataTime
                               urlString: (NSString *)urlString

{
    VideoModel *videoModel = [[VideoModel alloc] initWithVideoNameString:videoName playCountString:playCount timeString:time upDataTimeString:upDataTime urlString:urlString];
    return [videoModel autorelease];
}


@end
