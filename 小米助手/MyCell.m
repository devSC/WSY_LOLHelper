//
//  MyCell.m
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "MyCell.h"
#import "UserInfo.h"
#import "UIImageView+WebCache.h"

@implementation MyCell

//- (void)dealloc
//{
//    [_nameLabel release];
//    [_phoneNumberLabel release];
//    [_userImageView release];
//    [super dealloc];
//}
//
//
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self)
//    {
//        // Initialization code
//        self.nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(80, 10, 200, 30)] autorelease];
//        self.phoneNumberLabel = [[[UILabel alloc]  initWithFrame:CGRectMake(80, 40, 200, 30)] autorelease];
//        self.userImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)] autorelease];
//        
//        [self.contentView addSubview:_nameLabel];
//        [self.contentView addSubview:_phoneNumberLabel];
//        [self.contentView addSubview:_userImageView];
////        NSLog(@"111");
//    }
//    return self;
//}

- (void)dealloc
{
    [_skillImageView release];
    [_skillNameLabel release];
    [_contentLabel release];
    [_dataDic release];
    [_userExperienceLabel release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _dataDic = [[NSDictionary alloc] init];
        [self initSelfDataView];
    }
    return self;
}

- (void)initSelfDataView
{
    _skillImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 64, 64)];
    [self.contentView addSubview:_skillImageView];
    
    _skillNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 32)];
    [_skillNameLabel setFont:[UIFont systemFontOfSize:20]];
    [_skillNameLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_skillNameLabel];
    
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 300, 30)];
    [self.contentView addSubview:_contentLabel];
    [_contentLabel setFont:[UIFont systemFontOfSize:13]];
    [_contentLabel setTextColor:[UIColor blackColor]];
    
    _experienceName = [[UILabel alloc] init];
    [_experienceName setText:@"使用经验"];
    [_experienceName setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_experienceName];
    
    _userExperienceLabel = [[UILabel alloc] init];
    [_userExperienceLabel setFont:[UIFont systemFontOfSize:13]];
    [_userExperienceLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_userExperienceLabel];
    
}

- (void)setIntroductionText:(NSString*)text withExperienceText: (NSString *)etext{
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.contentLabel.text = text;
    //设置label的最大行数
    self.contentLabel.numberOfLines = 20;
    CGSize size = CGSizeMake(300, 1000);
    CGSize labelSize = [self.contentLabel.text sizeWithFont:self.contentLabel.font
                                          constrainedToSize:size
                                              lineBreakMode:NSLineBreakByClipping];
    self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y, labelSize.width, labelSize.height);
    
    [_experienceName setFrame:CGRectMake(10, self.contentLabel.frame.origin.y + self.contentLabel.frame.size.height, 300, 30)];
    
    [_userExperienceLabel setFrame:CGRectMake(10, self.experienceName.frame.origin.y + self.experienceName.frame.size.height - 30, 300, 30)];
    
    self.userExperienceLabel.text = etext;
    //设置label的最大行数
    self.userExperienceLabel.numberOfLines = 10;
    CGSize sizes = CGSizeMake(300, 1000);
    CGSize labelSizes = [self.userExperienceLabel.text sizeWithFont:self.userExperienceLabel.font
                                                  constrainedToSize:sizes lineBreakMode:NSLineBreakByClipping];
    self.userExperienceLabel.frame = CGRectMake(self.userExperienceLabel.frame.origin.x, self.userExperienceLabel.frame.origin.y +  self.userExperienceLabel.frame.size.height, labelSizes.width, labelSizes.height);
    
    //计算出自适应的高度
    frame.size.height = labelSize.height + 80 + labelSizes.height + 30 +10;
    self.frame = frame;
    
}
/*--------------------------------------------------------
 *重写父类方法实现子类差异化
 *-------------------------------------------------------*/
- (void)setDateForCell:(BaseModel *)dateForCell
{
    UserInfo *userInfo = (UserInfo *)dateForCell;
    [_userExperienceLabel setText:userInfo.userExperience];
    [_skillNameLabel setText:userInfo.skillName];
    [_skillImageView setImageWithURL:[NSURL URLWithString:userInfo.imageUrl]];
    [self setIntroductionText:userInfo.content withExperienceText:userInfo.userExperience];
}



@end
