//
//  DetailView.m
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DetailView.h"
#import "UIImageView+WebCache.h"

#define kImageWidth 50 //UITableViewCell里面图片的宽度
#define kImageHeight 75//UITableViewCell里面图片的高度
#define kRowOfIconNumber 5 //每行的button个数
#define kFontSizes 17

@implementation DetailView

- (void)dealloc
{
    [_iconImage release];
    [_nameLabel release];
    [_priceLabel release];
    [_priceLabel release];
    [_viewNumber release];
    
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
          }
    return self;
}

- (void)initSubviews
{
//    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(5, 4, 310, 47)];
//    [blackView setBackgroundColor:[UIColor grayColor]];
//    [self addSubview:blackView];
//    UIView *withterView = [[UIView alloc] initWithFrame:CGRectMake(10, 5, 300, 45)];
//    [blackView setBackgroundColor:[UIColor whiteColor]];
//    [self addSubview:withterView];
    
    
    _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, kImageWidth, kImageWidth)];
    [self addSubview:_iconImage];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 230, 20)];
    [_nameLabel setTextAlignment:NSTextAlignmentLeft];
    [_nameLabel setTextColor:[UIColor blackColor]];
    [_nameLabel setFont:[UIFont systemFontOfSize:kFontSizes]];
    [self addSubview:_nameLabel];
    
    _priceName = [[UILabel alloc] initWithFrame:CGRectMake(70, 30, 200, 20)];
    [_priceName setTextAlignment:NSTextAlignmentLeft];
    [_priceName setTextColor:[UIColor blackColor]];
    [_priceName setFont:[UIFont systemFontOfSize:kFontSizes]];
    [_priceName setText:@"价格:"];
    [self addSubview:_priceName];

    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 30, 100, 20)];
    [_priceLabel setTextAlignment:NSTextAlignmentLeft];
    [_priceLabel setTextColor:[UIColor blackColor]];
    [_priceLabel setFont:[UIFont systemFontOfSize:kFontSizes]];
    [self addSubview:_priceLabel];
    
    
    _bigImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, 300, 200)];
    [self addSubview:_bigImageView];
}

- (void)setDataDic:(NSDictionary *)dataDic
{
    if (_dataDic != dataDic) {
        [_dataDic release];
        _dataDic = [dataDic retain];
        if (_viewNumber.intValue == 2) {
            [self loadSpellData];
        }
        else{
            [self loadData];
        }
    }
}

- (void)loadData
{
    NSString *iconString = [_dataDic objectForKey:@"icon"];
    [_nameLabel setText:[_dataDic objectForKey:@"name"]];
    [_priceLabel setText:[[_dataDic objectForKey:@"price"] stringByAppendingString:@" 金币"]];
    [_iconImage setImageWithURL:[NSURL URLWithString:iconString]];

}
- (void)loadSpellData{
    NSString *iconString = [_dataDic objectForKey:@"icon"];
    NSString *imageString = [_dataDic objectForKey:@"img"];
    [_nameLabel setText:[_dataDic objectForKey:@"name"]];
    [_priceName setText:[_dataDic objectForKey:@"level"]];
    [_priceName setFont:[UIFont systemFontOfSize:kFontSizes - 5]];
    [_iconImage setImageWithURL:[NSURL URLWithString:iconString]];
    [_bigImageView setImageWithURL:[NSURL URLWithString:imageString]];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
