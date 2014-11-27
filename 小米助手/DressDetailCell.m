//
//  DressDetailCell.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DressDetailCell.h"
#import "DressDetailModel.h"
#import "DressButton.h"
#import "UIImageView+WebCache.h"
#import "NetApi.h"

#define kFontSize 13


@implementation DressDetailCell

- (void)dealloc
{
    [_nameLabel release];
    [_imageArray release];
    [_lowLabel release];
    Block_release(_Goodsblock);
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 220, 20)];
    [_nameLabel setTextColor:[UIColor blackColor]];
    [_nameLabel setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:_nameLabel];
    
    _lowLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 75, 300, 15)];
    [_lowLabel setTextColor:[UIColor orangeColor]];
    [_lowLabel setTextAlignment:NSTextAlignmentLeft];
    [_lowLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    [self.contentView addSubview:_lowLabel];
    
    
    _imageButton1 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton1 setFrame:CGRectMake(10, 20, 50, 50)];
    [self.contentView addSubview:_imageButton1];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    _imageButton2 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton2 setFrame:CGRectMake(60, 20, 50, 50)];
    [self.contentView addSubview:_imageButton2];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    _imageButton3 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton3 setFrame:CGRectMake(110, 20, 50, 50)];
    [self.contentView addSubview:_imageButton3];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    _imageButton4 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton4 setFrame:CGRectMake(160, 20, 50, 50)];
    [self.contentView addSubview:_imageButton4];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    _imageButton5 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton5 setFrame:CGRectMake(210, 20, 50, 50)];
    [self.contentView addSubview:_imageButton5];
    //    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    _imageButton6 = [DressButton buttonWithType:UIButtonTypeCustom];
    [_imageButton6 setFrame:CGRectMake(260, 20, 50, 50)];
    [self.contentView addSubview:_imageButton6];
//    [_imageButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    _imageArray = [[NSArray alloc] init];

}

- (void)setDateForCell:(BaseModel *)dateForCell
{
    [super setDateForCell:dateForCell];
    DressDetailModel *dressModel = (DressDetailModel *)dateForCell;
    [_nameLabel setText:dressModel.nameString];
    if (dressModel.lowString.length != 0 && dressModel.imageArray != nil) {
        [_lowLabel setText:dressModel.lowString];
        [self setImageArrayNumber1:dressModel.imageArray];
        CGRect frame = [self frame];
        frame.size.height = 95;
        self.frame = frame;
        [self setButtonAction];
    }
    else if(dressModel.lowString.length == 0)
    {
        [self setImageArrayNumber2:dressModel.imageArray];
        CGRect frame = [self frame];
        frame.size.height = 80 ;
        self.frame = frame;
       [self setButtonAction];
    }
    else if (dressModel.imageArray == nil)
    {
        [self setContentLabelWithString:dressModel.lowString];
    }

}

- (void)setButtonAction
{
    [_imageButton1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_imageButton2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_imageButton3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_imageButton4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_imageButton5 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_imageButton6 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonAction: (DressButton *)button
{
    if (_Goodsblock) {
        _Goodsblock(button.iconString);
    }
}

- (void)setContentLabelWithString: (NSString *)string
{
    [_lowLabel setFrame:CGRectMake(10, 20, 220, 20)];
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.lowLabel.text = string;
    //设置label的最大行数
    self.lowLabel.numberOfLines = 10;
    CGSize size = CGSizeMake(300, 1000);
    CGSize labelSize = [self.lowLabel.text sizeWithFont:self.lowLabel.font
                                          constrainedToSize:size
                                              lineBreakMode:NSLineBreakByClipping];
    self.lowLabel.frame = CGRectMake(self.lowLabel.frame.origin.x, self.lowLabel.frame.origin.y, labelSize.width, labelSize.height);
    //计算出自适应的高度
    frame.size.height = labelSize.height + 20 + 5;
    self.frame = frame;
}


- (void)setImageArrayNumber1:(NSArray *)imageArray
{
    if (_imageArray != imageArray) {
        [_imageArray release];
        _imageArray = [imageArray retain];
        [self loadImageToButton];
    }
    
}

//物品数组
- (void)setImageArrayNumber2:(NSArray *)imageArray
{
    if (_imageArray != imageArray) {
        [_imageArray release];
        _imageArray = [imageArray retain];
        [self loadImageToButton2];
    }
    
}

- (void)loadImageToButton
{
    switch (_imageArray.count) {
        case 1:{
            [self case1method];
        }break;
        case 2:{
            [self case2method];
        }break;
        case 3:{
            [self case3method];
        }break;
        case 4:{
            [self case4method];
        }break;
        case 5:{
            [self case5Method];
        }break;
        case 6:{
            [self case6Method];
        }break;
            
        default:
            break;
    }
}

- (void)loadImageToButton2
{
    NSArray *array = nil;
    if (_imageArray.count >= 6) {
        NSRange range = NSMakeRange(0, 6);
        array = [_imageArray subarrayWithRange:range];
    }
    else{
        array = _imageArray;
    }
    NSLog(@"----%lu", (unsigned long)array.count);
    NSLog(@"%lu", (unsigned long)array.count);
    switch (array.count) {
        case 1:{
            [self case1method2];
        }break;
        case 2:{
            [self case2method2];
        }break;
        case 3:{
            [self case3method2];
        }break;
        case 4:{
            [self case4method2];
        }break;
        case 5:{
            [self case5Method2];
        }break;
        case 6:{
            [self case6Method2];
        }break;
        default:
            break;
    }
}
- (void)case1method
{
    NSString *icon1 = [_imageArray objectAtIndex:0];
    
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon1]]];
    _imageButton1.iconString = icon1;

    [_imageButton2 setUserInteractionEnabled:NO];
    [_imageButton3 setUserInteractionEnabled:NO];
    [_imageButton4 setUserInteractionEnabled:NO];
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
}

- (void)case2method
{
    NSString *icon1 = [_imageArray objectAtIndex:0];
    NSString *icon2 = [_imageArray objectAtIndex:1];
    
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon1]]];
    _imageButton1.iconString = icon1;
    
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon2]]];
    _imageButton2.iconString = icon2;
    
    [_imageButton3 setUserInteractionEnabled:NO];
    [_imageButton4 setUserInteractionEnabled:NO];
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
}
- (void)case3method
{
    NSString *icon1 = [_imageArray objectAtIndex:0];
    NSString *icon2 = [_imageArray objectAtIndex:1];
    NSString *icon3 = _imageArray[2];
    
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon1]]];
    _imageButton1.iconString = icon1;
    
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon2]]];
    _imageButton2.iconString = icon2;
    
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon3]]];
    _imageButton3.iconString = icon3;
    
    [_imageButton4 setUserInteractionEnabled:NO];
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
}
- (void)case4method
{
    NSString *icon1 = [_imageArray objectAtIndex:0];
    NSString *icon2 = [_imageArray objectAtIndex:1];
    NSString *icon3 = _imageArray[2];
    NSString *icon4 = _imageArray[3];
    
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon1]]];
    _imageButton1.iconString = icon1;
    
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon2]]];
    _imageButton2.iconString = icon2;
    
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon3]]];
    _imageButton3.iconString = icon3;
    
    [_imageButton4.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon4]]];
    _imageButton4.iconString = icon4;
    
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
}

- (void)case5Method
{
    NSString *icon1 = [_imageArray objectAtIndex:0];
    NSString *icon2 = [_imageArray objectAtIndex:1];
    NSString *icon3 = _imageArray[2];
    NSString *icon4 = _imageArray[3];
    NSString *icon5 = _imageArray[4];
    
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon1]]];
    _imageButton1.iconString = icon1;
    
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon2]]];
    _imageButton2.iconString = icon2;
    
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon3]]];
    _imageButton3.iconString = icon3;
    
    [_imageButton4.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon4]]];
    _imageButton4.iconString = icon4;
    
    [_imageButton5.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon5]]];
    _imageButton5.iconString = icon5;
    
    [_imageButton6 setUserInteractionEnabled:NO];
}
- (void)case6Method
{
    NSString *icon1 = [_imageArray objectAtIndex:0];
    NSString *icon2 = [_imageArray objectAtIndex:1];
    NSString *icon3 = _imageArray[2];
    NSString *icon4 = _imageArray[3];
    NSString *icon5 = _imageArray[4];
    NSString *icon6 = _imageArray[5];
    
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon1]]];
    _imageButton1.iconString = icon1;
    
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon2]]];
    _imageButton2.iconString = icon2;
    
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon3]]];
    _imageButton3.iconString = icon3;
    
    [_imageButton4.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon4]]];
    _imageButton4.iconString = icon4;
    
    [_imageButton5.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon5]]];
    _imageButton5.iconString = icon5;
    
    [_imageButton6.iconImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kGoosApi, icon6]]];
    _imageButton6.iconString = icon6;
}
#pragma mark -  
#pragma mark - 物品
- (void)case1method2
{
    NSDictionary *dic1 = [_imageArray objectAtIndex:0];
    NSString *icon1 = [dic1 objectForKey:@"icon"];
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:icon1]];
    _imageButton1.iconString = [dic1 objectForKey:@"id"];
    
    [_imageButton2 setUserInteractionEnabled:NO];
    [_imageButton3 setUserInteractionEnabled:NO];
    [_imageButton4 setUserInteractionEnabled:NO];
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
}

- (void)case2method2
{
    
    NSDictionary *dic1 = [_imageArray objectAtIndex:0];
    NSString *icon1 = [dic1 objectForKey:@"icon"];
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:icon1]];
    _imageButton1.iconString = [dic1 objectForKey:@"id"];
    
    NSDictionary *dic2 = [_imageArray objectAtIndex:1];
    NSString *icon2 = [dic2 objectForKey:@"icon"];
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:icon2]];
    _imageButton2.iconString = [dic2 objectForKey:@"id"];
    
    
    [_imageButton3 setUserInteractionEnabled:NO];
    [_imageButton4 setUserInteractionEnabled:NO];
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
}
- (void)case3method2
{
    NSDictionary *dic1 = [_imageArray objectAtIndex:0];
    NSString *icon1 = [dic1 objectForKey:@"icon"];
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:icon1]];
    _imageButton1.iconString = [dic1 objectForKey:@"id"];
    
    NSDictionary *dic2 = [_imageArray objectAtIndex:1];
    NSString *icon2 = [dic2 objectForKey:@"icon"];
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:icon2]];
    _imageButton2.iconString = [dic2 objectForKey:@"id"];
    
    NSDictionary *dic3 = [_imageArray objectAtIndex:2];
    NSString *icon3 = [dic3 objectForKey:@"icon"];
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:icon3]];
    _imageButton3.iconString = [dic3 objectForKey:@"id"];

    
    [_imageButton4 setUserInteractionEnabled:NO];
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
}
- (void)case4method2
{
    NSDictionary *dic1 = [_imageArray objectAtIndex:0];
    NSString *icon1 = [dic1 objectForKey:@"icon"];
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:icon1]];
    _imageButton1.iconString = [dic1 objectForKey:@"id"];
    
    NSDictionary *dic2 = [_imageArray objectAtIndex:1];
    NSString *icon2 = [dic2 objectForKey:@"icon"];
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:icon2]];
    _imageButton2.iconString = [dic2 objectForKey:@"id"];
    
    NSDictionary *dic3 = [_imageArray objectAtIndex:2];
    NSString *icon3 = [dic3 objectForKey:@"icon"];
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:icon3]];
    _imageButton3.iconString = [dic3 objectForKey:@"id"];
    
    NSDictionary *dic4 = [_imageArray objectAtIndex:3];
    NSString *icon4 = [dic4 objectForKey:@"icon"];
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:icon4]];
    _imageButton3.iconString = [dic4 objectForKey:@"id"];
    
    [_imageButton5 setUserInteractionEnabled:NO];
    [_imageButton6 setUserInteractionEnabled:NO];
}

- (void)case5Method2
{
    NSDictionary *dic1 = [_imageArray objectAtIndex:0];
    NSString *icon1 = [dic1 objectForKey:@"icon"];
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:icon1]];
    _imageButton1.iconString = [dic1 objectForKey:@"id"];
    
    NSDictionary *dic2 = [_imageArray objectAtIndex:1];
    NSString *icon2 = [dic2 objectForKey:@"icon"];
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:icon2]];
    _imageButton2.iconString = [dic2 objectForKey:@"id"];
    
    NSDictionary *dic3 = [_imageArray objectAtIndex:2];
    NSString *icon3 = [dic3 objectForKey:@"icon"];
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:icon3]];
    _imageButton3.iconString = [dic3 objectForKey:@"id"];
    
    NSDictionary *dic4 = [_imageArray objectAtIndex:3];
    NSString *icon4 = [dic4 objectForKey:@"icon"];
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:icon4]];
    _imageButton3.iconString = [dic4 objectForKey:@"id"];
    
    NSDictionary *dic5 = [_imageArray objectAtIndex:4];
    NSString *icon5 = [dic5 objectForKey:@"icon"];
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:icon5]];
    _imageButton3.iconString = [dic5 objectForKey:@"id"];
    
    [_imageButton6 setUserInteractionEnabled:NO];
}
- (void)case6Method2
{
    NSDictionary *dic1 = [_imageArray objectAtIndex:0];
    NSString *icon1 = [dic1 objectForKey:@"icon"];
    [_imageButton1.iconImageView setImageWithURL:[NSURL URLWithString:icon1]];
    _imageButton1.iconString = [dic1 objectForKey:@"id"];
    
    NSDictionary *dic2 = [_imageArray objectAtIndex:1];
    NSString *icon2 = [dic2 objectForKey:@"icon"];
    [_imageButton2.iconImageView setImageWithURL:[NSURL URLWithString:icon2]];
    _imageButton2.iconString = [dic2 objectForKey:@"id"];
    
    NSDictionary *dic3 = [_imageArray objectAtIndex:2];
    NSString *icon3 = [dic3 objectForKey:@"icon"];
    [_imageButton3.iconImageView setImageWithURL:[NSURL URLWithString:icon3]];
    _imageButton3.iconString = [dic3 objectForKey:@"id"];
    
    NSDictionary *dic4 = [_imageArray objectAtIndex:3];
    NSString *icon4 = [dic4 objectForKey:@"icon"];
    [_imageButton4.iconImageView setImageWithURL:[NSURL URLWithString:icon4]];
    _imageButton4.iconString = [dic4 objectForKey:@"id"];
    
    NSDictionary *dic5 = [_imageArray objectAtIndex:4];
    NSString *icon5 = [dic5 objectForKey:@"icon"];
    [_imageButton5.iconImageView setImageWithURL:[NSURL URLWithString:icon5]];
    _imageButton5.iconString = [dic5 objectForKey:@"id"];
    
    NSDictionary *dic6 = [_imageArray objectAtIndex:5];
    NSString *icon6 = [dic6 objectForKey:@"icon"];
    [_imageButton6.iconImageView setImageWithURL:[NSURL URLWithString:icon6]];
    _imageButton6.iconString = [dic5 objectForKey:@"id"];
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
