//
//  UserInfo.h
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfo : BaseModel

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *skillName;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *userExperience;

- (id)initWithImageUrl: (NSString *)url skillName: (NSString *)skill content: (NSString *)content userExperience: (NSString *)userExperience;
+ (id)userInfoWithImageUrl: (NSString *)url skillName: (NSString *)skill content: (NSString *)content userExperience: (NSString *)userExperience;
@end
