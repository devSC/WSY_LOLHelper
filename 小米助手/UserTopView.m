//
//  UserTopView.m
//  小米助手
//
//  Created by CC&DD on 14-3-18.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "UserTopView.h"
#import "JSONKit.h"
#import "NetAPI.h"
#import "WXBaseModel.h"
#import <QuartzCore/QuartzCore.h>
#import "CCSegmentedControl.h"
#import "AFNetworking.h"

@implementation UserTopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
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



- (void)newThred
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *codeString = [NetAPI stingWithName:self.nameString serverString:self.serverString];
        NSDictionary *dic = [codeString objectFromJSONString];
        NSDictionary *userDic = [dic objectForKey:_nameString];
        NSDictionary *detailDic = [WXBaseModel getUserGlobleDataWithOriginalDic:userDic];
        NSDictionary *zdlDic = [WXBaseModel getUserZdlWithOriginalDic:userDic];
        self.goodString = [detailDic objectForKey:@"good"];
        self.userIconString = [detailDic objectForKey:@"icon"];
        self.blockString = [detailDic objectForKey:@"blocked"];
        self.levelString = [detailDic objectForKey:@"level"];
        self.totalScoreString = [zdlDic objectForKey:@"totalScore"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showData];
        });
        
        
    });
}


- (void)showData
{
    //给imageView设置圆角
    [self.userIcon.layer setMasksToBounds:YES];
    [self.userIcon.layer setCornerRadius:20];
    
    
    self.serverName.text = _serverString;
    self.userName.text = _nameString;
    self.good.text = _goodString;
    [self.userIcon setImage:[UIImage imageWithData:[WXBaseModel getUserInfoImageWithIcon:_userIconString]]] ;
    self.level.text = _levelString;
    self.blocked.text = _blockString;
    self.totalScore.text = [NSString stringWithFormat:@"%@", _totalScoreString];


}

+ (UserTopView *)initTopView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"UserTopView" owner:self options:nil] firstObject];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _segmentedControl = [[CCSegmentedControl alloc] initWithItems:@[@"所有英雄", @"免费英雄"]];
    _segmentedControl.frame = CGRectMake(0, 210, 320, 30);
    
    //设置背景图片，或者设置颜色，或者使用默认白色外观
    _segmentedControl.backgroundImage = [UIImage imageNamed:@"segment_bg.png"];
    //segmentedControl.backgroundColor = [UIColor grayColor];
    //阴影部分图片，不设置使用默认椭圆外观的stain
    _segmentedControl.selectedStainView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stain.png"]] autorelease];
    
    _segmentedControl.selectedSegmentTextColor = [UIColor whiteColor];
    _segmentedControl.segmentTextColor = [self colorWithHexString:@"#535353"];
    [self addSubview:_segmentedControl];
    [_segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self newThred];
    

}
- (void)valueChanged:(id)sender
{
    CCSegmentedControl* segmentedControl = sender;
    NSLog(@"%s line:%d segment has changed to %ld", __FUNCTION__, __LINE__, (long)segmentedControl.selectedSegmentIndex);
    if (_segString) {
        _segString(segmentedControl.selectedSegmentIndex);
    }
}

- (void)dealloc {
    [_userName release];
    [_serverName release];
    [_good release];
    [_blocked release];
    [_userIcon release];
    [_nameString release];
    [_userIconString release];
    [_goodString release];
    [_blockString release];
    [_levelString release];
    [_totalScoreString release];
    [_segmentedControl release];
    [_level release];
    [_totalScore release];
    [super dealloc];
}
@end
