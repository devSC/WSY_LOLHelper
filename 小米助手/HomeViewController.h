//
//  HomeViewController.h
//  小米助手
//  战斗力查询视图控制器
//  Created by CC&DD on 14-3-14.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseViewController.h"

@class RootView;
@interface HomeViewController : BaseViewController
{
    //判断是否进入下一层
    BOOL _goView;
}

@property (nonatomic, retain) RootView *rootView;

@end
