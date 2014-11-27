//
//  BaseViewController.h
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewControllerCell : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataArray;
}

- (NSArray *)hardCode;
@end
