//
//  UserInfo.m
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

//- (void)dealloc
//{
//    [_imagePath release];
//    [_phoneNumber release];
//    [_name release];
//    [super dealloc];
//}
//- (instancetype)initWithName: (NSString *)name phoneNumber: (NSString *)phoneNumber ImagePath: (NSString *)imagePath{
//    self = [super init];
//    if (self) {
//        [self setName:name];
//        [self setPhoneNumber:phoneNumber];
//        [self setImagePath:imagePath];
//    }
//    return self;
//}
//
//+ (instancetype)userInfoWithName: (NSString *)name phoneNumber: (NSString *)phoneNumber ImagePath: (NSString *)imagePath{
//    UserInfo *userInfo = [[UserInfo alloc] initWithName:name phoneNumber:phoneNumber ImagePath:imagePath];
//    return [userInfo autorelease];
//}

//- (UIImage *)userImage
//{
//    UIImage *image = [[UIImage alloc] initWithContentsOfFile:_imagePath];
//    return [image autorelease];
//}

- (void)dealloc
{
    [_content release];
    [_imageUrl release];
    [_skillName release];
    [_userExperience release];
    
    [super dealloc];
}

- (id)initWithImageUrl:(NSString *)url
             skillName:(NSString *)skill
               content:(NSString *)content
        userExperience:(NSString *)userExperience
{
    self = [super init];
    if (self) {
        [self setImageUrl:url];
        [self setUserExperience:userExperience];
        [self setSkillName:skill];
        [self setContent:content];
    }
    return self;
}

+ (id)userInfoWithImageUrl:(NSString *)url
                 skillName:(NSString *)skill
                   content:(NSString *)content
            userExperience:(NSString *)userExperience
{
    UserInfo *userInfo = [[UserInfo alloc] initWithImageUrl:url skillName:skill content:content userExperience:userExperience];
    return [userInfo autorelease];
}

@end
