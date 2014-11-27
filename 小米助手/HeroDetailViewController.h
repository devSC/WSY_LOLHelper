//
//  HomeViewController.h
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseViewControllerCell.h"
@class HeroDetailView;
@interface HeroDetailViewController :BaseViewControllerCell

@property (nonatomic, retain) HeroDetailView *detailView;
@property (nonatomic, retain) NSDictionary *dic;
@property (nonatomic, copy) NSString *heroId;
@property (nonatomic, copy) NSString *heroEname;
@property (nonatomic, copy) NSString *topImageUrl;
@property (nonatomic, retain) NSMutableArray *skillIconArray;

@end
