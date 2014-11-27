//
//  NetAPI.m
//  小米助手
//
//  Created by CC&DD on 14-3-15.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "NetAPI.h"

@implementation NetAPI

+ (NSString *)stingWithName: (NSString *)nameString
                    serverString: (NSString *)serverString
{

    NSString *urlString = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiMobile.php?action=getPlayersInfo&target=%@&serverName=%@", nameString, serverString];
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:url
                                                encoding:NSUTF8StringEncoding
                                                   error:&error];
    if (error) {
        NSLog(@"netApi error:%@", [error localizedDescription]);
    }
    return [[string retain] autorelease];
}

+ (NSURL *)getRecentGameListWithName: (NSString *)nameString server: (NSString *)serverString
{
    NSString *urlString = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/matchList_ios.php?playerName=%@&serverName=%@&timestamp=1394794222.432519", nameString, serverString];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    return [[url retain] autorelease];
}



@end
