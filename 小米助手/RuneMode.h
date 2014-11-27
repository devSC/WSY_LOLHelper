//
//  RuneMode.h
//  小米助手
//
//  Created by CC&DD on 14-3-29.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseModel.h"

@interface RuneMode : BaseModel

@property (nonatomic, copy) NSString *iconUrlString;
@property (nonatomic, copy) NSString *nameString;
//descriptionString
@property (nonatomic, copy) NSString *descString;

- (id)initRuneModelWithIconUrlString: (NSString *)iconString
                          nameString: (NSString *)nameString
                          decrString: (NSString *)decrString;
+ (id)RuneModelWithIconUrlString: (NSString *)iconString
                      nameString: (NSString *)nameString
                      decrString: (NSString *)decrString;
@end
