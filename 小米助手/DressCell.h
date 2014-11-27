//
//  DressCell.h
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseCell.h"

@class DressButton;
@interface DressCell : BaseCell


@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *authorLabel;
@property (nonatomic, retain) UILabel *combatLabel;
@property (nonatomic, retain) NSArray *imageArray;

@property (nonatomic, retain) DressButton *imageButton1;
@property (nonatomic, retain) DressButton *imageButton2;
@property (nonatomic, retain) DressButton *imageButton3;
@property (nonatomic, retain) DressButton *imageButton4;
@property (nonatomic, retain) DressButton *imageButton5;
@property (nonatomic, retain) DressButton *imageButton6;




@end
