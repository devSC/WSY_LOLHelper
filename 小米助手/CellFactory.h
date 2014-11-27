//
//  CellFactory.h
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseModel,BaseCell;
@interface CellFactory : NSObject

+ (BaseCell *)cellForModel:(BaseModel *)modelForCell reuseabledIdentifier:(NSString *)cellIdentifier;

+ (Class)cellClassForModel: (BaseModel *) dataModel;
@end
