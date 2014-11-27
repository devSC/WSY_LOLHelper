//
//  DetailView.h
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailView : UIView

@property (nonatomic, retain) NSDictionary *dataDic;
@property (nonatomic, retain) UIImageView *iconImage;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UILabel *priceName;
@property (nonatomic, retain) UIImageView *bigImageView;
@property (nonatomic, copy) NSString *viewNumber;



@end
