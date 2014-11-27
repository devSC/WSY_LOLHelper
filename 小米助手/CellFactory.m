//
//  CellFactory.m
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "CellFactory.h"

#import "MyCell.h"
#import "UserInfo.h"

#import "MyCell2.h"
#import "UserInfo2.h"

#import "VideoCell.h"
#import "VideoModel.h"

#import "DressCell.h"
#import "DressModel.h"

#import "DressDetailModel.h"
#import "DressDetailCell.h"

#import "SpellModel.h"
#import "SpellCell.h"

#import "RuneMode.h"
#import "RuneCell.h"

@implementation CellFactory

+ (BaseCell *)cellForModel:(BaseModel *)modelForCell reuseabledIdentifier:(NSString *)cellIdentifier
{
    //获得数据模型相对应的cell子类
    Class cellClass = [self cellClassForModel:modelForCell];
    
    //用子类对象初始化父类指针
    BaseCell *cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    return [cell autorelease];
}


+ (Class)cellClassForModel:(BaseModel *)dataModel
{
    /*------初始化一个cellClass用来返回Class-------*/
    Class cellClass = nil;
    if ([dataModel isKindOfClass:[UserInfo class]]) {
        cellClass = [MyCell class];
    }
    if ([dataModel isKindOfClass:[UserInfo2 class]]) {
        cellClass = [MyCell2 class];
    }
    if ([dataModel isKindOfClass:[VideoModel class]]) {
        cellClass = [VideoCell class];
    }
    if ([dataModel isKindOfClass:[DressModel class]]) {
        cellClass = [DressCell class];
    }
    if ([dataModel isKindOfClass:[DressDetailModel class]]) {
        cellClass = [DressDetailCell class];
    }
    if ([dataModel isKindOfClass:[SpellModel class]]) {
        cellClass = [SpellCell class];
    }
    if ([dataModel isKindOfClass:[RuneMode class]]) {
        cellClass = [RuneCell class];
    }
    return cellClass;
}
@end
