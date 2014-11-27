//
//  DetailNewsViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-31.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DetailNewsViewController.h"
#import "WXBaseModel.h"

@interface DetailNewsViewController ()

@end

@implementation DetailNewsViewController

- (void)dealloc
{
    [_webView release];
    [_urlString release];
    
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat device = [[[UIDevice currentDevice] systemVersion] floatValue];
    NSString *urlString = [NSString stringWithFormat:kIdNew, _urlString, device];
    NSDictionary *dic = [WXBaseModel getUrlStringContentWithUrlString:urlString];
    NSDictionary *data = [dic objectForKey:@"data"];
    NSString *htmlString = [data objectForKey:@"content"];
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    [_webView loadHTMLString:htmlString baseURL:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
