//
//  SpellViewController.h
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpellViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSString *urlString;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *dataArray;

@end
