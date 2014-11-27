//
//  GoodsCustomCell.m
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "GoodsCustomCell.h"
#import "GoodsImageButton.h"
#import "UIImageView+WebCache.h"

#define kImageWidth 60 //UITableViewCell里面图片的宽度
#define kImageHeight 75//UITableViewCell里面图片的高度
#define kRowOfIconNumber 5 //每行的button个数

@implementation GoodsCustomCell

- (void)dealloc
{
    [_button1 release];
    [_button2 release];
    [_button3 release];
    [_button4 release];
    [_button5 release];
    
    Block_release(_block);
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setButtonArray:(NSMutableArray *)buttonArray
{
    if (_buttonArray != buttonArray) {
        [_buttonArray release];
        _buttonArray = [buttonArray retain];
        switch (_buttonArray.count) {
            case 0:{
                for (UIView *view in self.contentView.subviews) {
                    [view removeFromSuperview];
                }
            }
                break;
            case 1:{
                [_button2 removeFromSuperview];
                [_button3 removeFromSuperview];
                [_button4 removeFromSuperview];
                [_button5 removeFromSuperview];
                [self initButton1];
            }break;
            case 2:{
                [_button3 removeFromSuperview];
                [_button4 removeFromSuperview];
                [self initButton1];
                [self initButton2];
            }break;
            case 3:{
                [_button4 removeFromSuperview];
                [self initButton1];
                [self initButton2];
                [self initButton3];
            }break;
            case 4:{
                [self initButton1];
                [self initButton2];
                [self initButton3];
                [self initButton4];
                [_button5 removeFromSuperview];
            }break;
            case 5:{
                [self initButton1];
                [self initButton2];
                [self initButton3];
                [self initButton4];
                [self initButton5];
            }break;
            default:
                break;
        }
        
    }
    
    
}

//初始化Button1
- (void)initButton1
{
    if (_button1 == nil) {
        _button1 = [[GoodsImageButton alloc] initWithFrame:CGRectMake(10, 0, kImageWidth, kImageWidth)];
        [_button1 addTarget:self action:@selector(returnDataWithblock:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if (_button1.superview != self.contentView) {
        [self.contentView addSubview:_button1];
    }
    [self loadImageButtonDetailDataWithImageButton:_button1 buttonID:0];
    
}
- (void)initButton2
{
    if (_button2 == nil) {
        _button2 = [[GoodsImageButton alloc] initWithFrame:CGRectMake(70, 0, kImageWidth, kImageWidth)];
        [_button2 addTarget:self action:@selector(returnDataWithblock:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (_button2.superview != self.contentView) {
        [self.contentView addSubview:_button2];
    }
    [self loadImageButtonDetailDataWithImageButton:_button2 buttonID:1];
    
    
}

- (void)initButton3
{
    if (_button3 == nil) {
        _button3 = [[GoodsImageButton alloc] initWithFrame:CGRectMake(130, 0, kImageWidth, kImageWidth)];
        [_button3 addTarget:self action:@selector(returnDataWithblock:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self loadImageButtonDetailDataWithImageButton:_button3 buttonID:2];
    if (_button3.superview != self.contentView) {
        [self.contentView addSubview:_button3];
    }
}

- (void)initButton4
{
    if (_button4 == nil) {
        _button4 = [[GoodsImageButton alloc] initWithFrame:CGRectMake(190, 0, kImageWidth, kImageWidth)];
        [_button4 addTarget:self action:@selector(returnDataWithblock:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if (_button4.superview != self.contentView) {
        [self.contentView addSubview:_button4];
        
    }
    [self loadImageButtonDetailDataWithImageButton:_button4 buttonID:3];
}
- (void)initButton5
{
    if (_button5 == nil) {
        _button5 = [[GoodsImageButton alloc] initWithFrame:CGRectMake(250, 0, kImageWidth, kImageWidth)];
        [_button5 addTarget:self action:@selector(returnDataWithblock:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if (_button5.superview != self.contentView) {
        [self.contentView addSubview:_button5];
        
    }
    [self loadImageButtonDetailDataWithImageButton:_button5 buttonID:4];
}


//button事件
- (void)returnDataWithblock: (GoodsImageButton *)button
{
    if (_block) {
        _block(button.goodsId);
    }
}

//装载button上的数据
- (void)loadImageButtonDetailDataWithImageButton: (GoodsImageButton *)imageButton
                                        buttonID: (NSInteger)buttonID
{
    NSDictionary *dic = [_buttonArray objectAtIndex:buttonID];
    NSString *name = [dic objectForKey:@"name"];
    NSString *urlString = [dic objectForKey:@"icon"];
    imageButton.nameLabel.text = name;
    imageButton.goodsId = [dic objectForKey:@"id"];
    [imageButton.iconImage setImageWithURL:[NSURL URLWithString:urlString]];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
