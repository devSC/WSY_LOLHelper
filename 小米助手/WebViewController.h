//
//  WebViewController.h
//  小米助手
//
//  Created by CC&DD on 14-3-20.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, copy) NSString *urlString;
//通过Id来判断是哪一个页面过来的
@property (nonatomic, copy) NSString *ID;
@end
