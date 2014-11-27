//
//  DataStationView.h
//  小米助手
//
//  Created by CC&DD on 14-3-20.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataStationView : UIView
@property (retain, nonatomic) IBOutlet UITableView *tableView;
+ (DataStationView *)initDataStationView;
@end
