//
//  MyScrollViewButton.m
//  小米助手
//
//  Created by CC&DD on 14-3-30.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "MyScrollViewButton.h"
#import "UIImageView+WebCache.h"


@implementation MyScrollViewButton

- (void)dealloc
{
    [_banImage release];
    [_articleId release];
    [_dataDic release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self initSubView];
    }
    return self;
}
- (void)initSubView
{
    _banImage = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_banImage];
    
}
- (void)setDataDic:(NSDictionary *)dataDic
{
    if (_dataDic != dataDic) {
        [_dataDic release];
        _dataDic = [dataDic retain];
        NSString *urlString = [_dataDic objectForKey:@"photo"];
        [self.banImage setImageWithURL:[NSURL URLWithString:urlString]];
        self.articleId = [_dataDic objectForKey:@"id"];
    }
}




@end
