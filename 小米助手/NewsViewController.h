//
//  NewsViewController.h
//  小米助手
//
//  Created by CC&DD on 14-3-14.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseViewController.h"
#import "MJRefreshBaseView.h"

@class MyScrollView;
@class MJRefreshFooterView;
@class MJRefreshHeaderView;
@class RTSpinKitView;
@interface NewsViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate, MJRefreshBaseViewDelegate>
{
    // 状态
    MJRefreshState _state;
}


@property (nonatomic, retain) MyScrollView *myScorollView;
@property (nonatomic, retain) NSArray *recommArray;
//获得tableView资料
@property (nonatomic, retain) NSMutableArray *resultArray;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) MJRefreshFooterView *refreshFoot;
@property (nonatomic, retain) MJRefreshHeaderView *refreshHeader;
@property (nonatomic, retain) RTSpinKitView *spinKitView;

- (void)setState:(MJRefreshState)state;

@end
