//
//  BaseCell.h
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseModel;
@interface BaseCell : UITableViewCell

/*--------------------------------------------------------
 *子类需重写此属性的setter方法,实现子类的差异化
 *-------------------------------------------------------*/
@property (nonatomic, retain) BaseModel *dateForCell;

/*--------------------------------------------------------
 *子类需重写次方法,来返回不同的cell高度
 *-------------------------------------------------------*/
+ (CGFloat)cellHeightForModel:(BaseModel *)dateForCell;
@end
