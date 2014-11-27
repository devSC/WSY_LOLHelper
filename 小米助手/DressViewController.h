//
//  DressViewController.h
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseViewControllerCell.h"

@class CustomHeaderView;
@interface DressViewController : BaseViewControllerCell
@property (nonatomic, retain) NSDictionary *dataDic;
@property (nonatomic, retain) NSMutableArray *skillArray;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) CustomHeaderView *headerView;
@property (nonatomic, retain) NSString *topImageUrl;
@end
