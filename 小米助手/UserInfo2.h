//
//  UserInfo2.h
//  TestMyCellF
//
//  Created by CC&DD on 14-3-25.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfo2 : BaseModel


@property (nonatomic, copy) NSString *analyseString;
@property (nonatomic, copy) NSString *backGroundString;

- (id)initWithAnalyseString: (NSString *)astring BackGroundString: (NSString *)bstring;
+ (id)userInfo2WithAnalyseString: (NSString *)astring BackGroundString: (NSString *)bstring;

@end
