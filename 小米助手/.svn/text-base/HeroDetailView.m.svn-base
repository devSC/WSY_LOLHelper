//
//  HeroDetailView.m
//  LOLBOX
//
//  Created by CC&DD on 14-3-24.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "HeroDetailView.h"
#import "CCSegmentedControl.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>

#define kBackButtonWidth 20
@implementation HeroDetailView

- (void)dealloc {
    [_nameLabel release];
    [_backButton release];
    [_priceLabel release];
    [_goldPriceLabel release];
    [_tableView release];
    [_firstImage release];
    Block_release(_myBlock);
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self initDetailView];
    }
    return self;
}

- (void)initDetailView
{
    
//    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, kBackButtonWidth+5)];
//    [blackView setBackgroundColor:[UIColor blackColor]];
//    [blackView.layer setOpacity:0.2];
//    [_nameLabel addSubview:blackView];


    _firstImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, -10, 320, self.bounds.size.height - 348 + 210)];
    [self addSubview:_firstImage];
    
    //初始化视图等
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setFrame:CGRectMake(20, 25, kBackButtonWidth + 30, kBackButtonWidth)];
//    [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self addSubview:_backButton];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.bounds.size.width, kBackButtonWidth+5)];
    [_nameLabel setTextColor:[UIColor whiteColor]];
    [_nameLabel setFont:[UIFont systemFontOfSize:20]];
    [_nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_nameLabel];
    
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 155, 20)];
    [_priceLabel setTextAlignment:NSTextAlignmentRight];
    [_priceLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:_priceLabel];
    
    
    _goldPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 170, 165, 20)];
    [_goldPriceLabel setTextAlignment:NSTextAlignmentLeft];
    [_goldPriceLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:_goldPriceLabel];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 348, 320, 348 - 44)];
    [self addSubview:_tableView];
}


- (void)setDataArray:(NSArray *)dataArray
{
    if (_dataArray != dataArray) {
        [_dataArray release];
        _dataArray = [dataArray retain];
        [self loadDetailViewData];
    }
}
- (void)setDataDic:(NSDictionary *)dataDic
{
    if (_dataDic != dataDic) {
        [_dataDic release];
        _dataDic = [dataDic retain];
        [self loadDetailViewData];
    }
}

- (void)loadDetailViewData
{
    NSDictionary *dic = [_dataDic objectForKey:@"result"];
    _nameLabel.text = [dic objectForKey:@"name_c"];
    
    _priceLabel.text = [NSString stringWithFormat:@"金币:%@", [dic objectForKey:@"price_score"]];
    _goldPriceLabel.text = [NSString stringWithFormat:@"点券:%@",[dic objectForKey:@"price_rmb"]];
    NSString *url_string = [dic objectForKey:@"img_big"];
    [_firstImage setImageWithURL:[NSURL URLWithString:url_string]];
}





- (void)valueChanged:(id)sender
{
    CCSegmentedControl* segmentedControl = sender;
    if (_myBlock) {
        _myBlock(segmentedControl.selectedSegmentIndex);
    }
}



//加颜色
- (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

- (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}


@end
