//
//  UserUnderView.h
//  小米助手
//
//  Created by CC&DD on 14-3-18.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

//来判断行
typedef NS_ENUM(NSInteger, Typical) {
    row = 0,
    row1 = 1,
    row2 = 2,
    row3 = 3,
};

@interface UserUnderView : UIView<UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) NSMutableArray *dataArray;

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (retain, nonatomic) NSArray *array;
+ (UserUnderView *)initUnderView;
@end
