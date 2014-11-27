//
//  UITableGridViewCell.m
//  igridviewdemo
//
//  Created by vincent_guo on 13-12-12.
//  Copyright (c) 2013年 vincent_guo. All rights reserved.
//

#import "UITableGridViewCell.h"
#import "UIImageButton.h"
#import "UIImageView+WebCache.h"
#define kImageWidth 70 //UITableViewCell里面图片的宽度
#define kImageHeight 95//UITableViewCell里面图片的高度
#define kRowOfIconNumber 4 //每行的button个数

#define kImageWidth1 50 //UITableViewCell里面图片的宽度
#define kImageHeight1 70//UITableViewCell里面图片的高度
#define kRowOfIconNumber1 5 //每行的button个数

@implementation UITableGridViewCell

- (void)dealloc
{
    [_button1 release];
    [_button2 release];
    [_button3 release];
    [_button4 release];
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
        _button1 = [[UIImageButton alloc] initWithFrame:CGRectMake(12.5, 0, 70, 70)];
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
    _button2 = [[UIImageButton alloc] initWithFrame:CGRectMake(87.5, 0, 70, 70)];
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
        _button3 = [[UIImageButton alloc] initWithFrame:CGRectMake(162.5, 0, 70, 70)];
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
        _button4 = [[UIImageButton alloc] initWithFrame:CGRectMake(237.5, 0, 70, 70)];
        [_button4 addTarget:self action:@selector(returnDataWithblock:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if (_button4.superview != self.contentView) {
        [self.contentView addSubview:_button4];
        
    }
    [self loadImageButtonDetailDataWithImageButton:_button4 buttonID:3];
}


//button事件
- (void)returnDataWithblock: (UIImageButton *)button
{
    if (_block) {
        _block(button.heroId);
    }
}

//装载button上的数据
- (void)loadImageButtonDetailDataWithImageButton: (UIImageButton *)imageButton
                                        buttonID: (NSInteger)buttonID
{
    NSDictionary *dic = [_buttonArray objectAtIndex:buttonID];
    NSString *title = [dic objectForKey:@"title"];
    NSString *name = [dic objectForKey:@"name_c"];
    NSString *urlString = [dic objectForKey:@"img"];
    imageButton.nameLabel.text = name;
    imageButton.title.text = title;
    imageButton.heroId = [dic objectForKey:@"id"];
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
