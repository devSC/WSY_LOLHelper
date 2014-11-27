//
//  VidepWebViewController.h
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VidepWebViewController : UIViewController
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, retain) MPMoviePlayerController *MPPlayer;

@end
