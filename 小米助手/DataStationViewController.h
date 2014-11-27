//
//  DataStationViewController.h
//  小米助手
//
//  Created by CC&DD on 14-3-14.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseViewController.h"

@interface DataStationViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) NSArray *dataArray;
@end
