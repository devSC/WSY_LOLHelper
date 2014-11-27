//
//  NewCustomCell.h
//  小米助手
//
//  Created by CC&DD on 14-3-30.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCustomCell : UITableViewCell

@property (nonatomic, retain) NSDictionary *dic;
@property (nonatomic, retain) UIImageView *photo;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *contentLabel;
@property (nonatomic, retain) UILabel *readCount;

@end
