//
//  DressDetailModel.h
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseModel.h"

@interface DressDetailModel : BaseModel

@property (nonatomic, retain) NSString *nameString;
@property (nonatomic, retain) NSString *lowString;
@property (nonatomic, retain) NSArray *imageArray;

- (id)initWithNameString: (NSString *)name lowString: (NSString *)lowString imageArray: (NSArray *)array;
+ (id)dressDetailModelWithNameString: (NSString *)name lowString: (NSString *)lowString imageArray: (NSArray *)array;
@end
