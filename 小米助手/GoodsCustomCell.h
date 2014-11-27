//
//  GoodsCustomCell.h
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoodsImageButton;
@interface GoodsCustomCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, retain) GoodsImageButton *button1;
@property (nonatomic, retain) GoodsImageButton *button2;
@property (nonatomic, retain) GoodsImageButton *button3;
@property (nonatomic, retain) GoodsImageButton *button4;
@property (nonatomic, retain) GoodsImageButton *button5;


@property (nonatomic, copy) voidBlock_string block;

@end
