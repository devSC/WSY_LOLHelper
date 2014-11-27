//
//  HeroDetailView.h
//  LOLBOX
//
//  Created by CC&DD on 14-3-24.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^voidBlock_int)(int);
@interface HeroDetailView : UIView

@property (retain, nonatomic) UILabel *nameLabel;
@property (retain, nonatomic) UIButton *backButton;
@property (retain, nonatomic) UILabel *priceLabel;
@property (retain, nonatomic) UILabel *goldPriceLabel;
@property (retain, nonatomic) UITableView *tableView;
@property (retain, nonatomic) UIImageView *firstImage;

@property (retain, nonatomic) NSArray *dataArray;
@property (retain, nonatomic) NSDictionary *dataDic;
@property (copy, nonatomic) voidBlock_int myBlock;
@end
