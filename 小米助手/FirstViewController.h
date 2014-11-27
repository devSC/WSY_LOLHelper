//
//  FirstViewController.h
//  小米助手
//
//  Created by CC&DD on 14-3-15.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserUnderView;
@class ZdlView;
@interface FirstViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) NSArray *userInfoArray;
@property (retain, nonatomic) NSMutableArray *dataArray;
@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, copy) NSString *server;
@property (nonatomic, retain) UserUnderView *underView;
@property (nonatomic, retain) ZdlView *zdlView;

@property (nonatomic, copy) voidBlock_void myBlock;

- (void)setUserInfoArray:(NSArray *)userInfoArray;


@end
