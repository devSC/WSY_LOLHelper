//
//  DetailNewsViewController.h
//  小米助手
//
//  Created by CC&DD on 14-3-31.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailNewsViewController : UIViewController

@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, retain) UIWebView *webView;

@end
