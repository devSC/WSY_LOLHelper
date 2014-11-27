//
//  MyCell2.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-25.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "MyCell2.h"
#import "UserInfo2.h"

@implementation MyCell2
- (void)dealloc
{
    [_analyseLabel release];
    [_analyseName release];
    [_backGroundLabel release];
    [_backgroundName release];

    [super dealloc];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    _analyseName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 20)];
    [_analyseName setText:@"英雄分析:"];
    [_analyseName setTextColor:[UIColor grayColor]];
    [self.contentView addSubview:_analyseName];
    
    _analyseLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 30)];
    [_analyseLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_analyseLabel];
    [_analyseLabel setFont:[UIFont systemFontOfSize:13]];
    
    _backGroundLabel = [[UILabel alloc] init];
    [_backGroundLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_backGroundLabel];
    [_backGroundLabel setFont:[UIFont systemFontOfSize:13]];
    
    _backgroundName = [[UILabel alloc] init];
    [_backgroundName setTextColor:[UIColor grayColor]];
    [_backgroundName setText:@"英雄背景:"];
    [self.contentView addSubview:_backgroundName];
}
/*--------------------------------------------------------
 *重写父类方法实现子类差异化
 *-------------------------------------------------------*/
- (void)setDateForCell:(BaseModel *)dateForCell
{
    [super setDateForCell:dateForCell];
    UserInfo2 *userInfo = (UserInfo2 *)dateForCell;
    [self setIntroductionText:userInfo.analyseString withExperienceText:userInfo.backGroundString];
}

- (void)setIntroductionText:(NSString*)text withExperienceText: (NSString *)etext{
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.analyseLabel.text = text;
    //设置label的最大行数
    self.analyseLabel.numberOfLines = 10;
    CGSize size = CGSizeMake(300, 1000);
    CGSize labelSize = [self.analyseLabel.text sizeWithFont:self.analyseLabel.font
                                          constrainedToSize:size
                                              lineBreakMode:NSLineBreakByClipping];
    self.analyseLabel.frame = CGRectMake(self.analyseLabel.frame.origin.x, self.analyseLabel.frame.origin.y, labelSize.width, labelSize.height);
    
    
    [_backgroundName setFrame:CGRectMake(10, self.analyseLabel.frame.origin.y + self.analyseLabel.frame.size.height + 5, 300, 20)];
    
    [_backGroundLabel setFrame:CGRectMake(10, self.backgroundName.frame.origin.y + self.backgroundName.frame.size.height - 15, 300, 20)];
    
    self.backGroundLabel.text = etext;
    //设置label的最大行数
    self.backGroundLabel.numberOfLines = 100;
    CGSize sizes = CGSizeMake(300, 3000);
    CGSize labelSizes = [self.backGroundLabel.text sizeWithFont:
                         self.backGroundLabel.font constrainedToSize:sizes lineBreakMode:NSLineBreakByClipping];
    self.backGroundLabel.frame = CGRectMake(self.backGroundLabel.frame.origin.x, self.backGroundLabel.frame.origin.y +  self.backGroundLabel.frame.size.height, labelSizes.width, labelSizes.height);
    //计算出自适应的高度
    frame.size.height = labelSize.height  + labelSizes.height + 50;
    self.frame = frame;
    
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
