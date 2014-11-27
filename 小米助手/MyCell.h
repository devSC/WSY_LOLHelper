//
//  MyCell.h
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseCell.h"

@interface MyCell : BaseCell

@property (nonatomic, retain) UIImageView *skillImageView;
@property (nonatomic, retain) UILabel *skillNameLabel;
@property (nonatomic, retain) UILabel *contentLabel;
@property (nonatomic, retain) UILabel *userExperienceLabel;
@property (nonatomic, retain) NSDictionary *dataDic;
@property (nonatomic, retain) UILabel *experienceName;

@property (nonatomic, assign) CGFloat myFream;

- (void)setDataDic:(NSDictionary *)dataDic WithSection: (NSInteger)section;
- (void)setIntroductionText:(NSString*)text withExperienceText: (NSString *)etext;

@end
