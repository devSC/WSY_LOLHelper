//
//  WebViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-20.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewController

- (void)dealloc
{
    [_webView release];
    [_activityIndicator release];
    [_urlString release];
    [_ID release];
    
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
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [NSURL URLWithString:_urlString];
    NSURLRequest *requset = [NSURLRequest requestWithURL:url];
//    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [_webView loadRequest:requset];
//    [_webView loadHTMLString:content baseURL:nil];
    [self.view addSubview:_webView];
    [_webView setDelegate:self];
    
    if ([_ID isEqualToString:@"2"]) {
        UIView *navigation = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 70)];
        [navigation setBackgroundColor:[UIColor cyanColor]];
        [self.view addSubview:navigation];
        [navigation release];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(10, 20, 70, 44)];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"GoBack" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button2 setFrame:CGRectMake(250, 20, 60, 44)];
        [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button2 setTitle:@"Back" forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(backButtonAction2) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button2];
    }

}

- (void)backButtonAction
{
    [_webView goBack];
}
- (void)backButtonAction2
{
    [_webView setDelegate:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 
#pragma mark - webView delegate
- (void) webViewDidStartLoad:(UIWebView *)webView
{
    //创建UIActivityIndicatorView背底半透明View
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    [view setTag:108];
    [view setBackgroundColor:[UIColor blackColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    [view release];
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [_activityIndicator setCenter:self.view.center];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [self.view addSubview:_activityIndicator];
    [_activityIndicator startAnimating];
}
//    加载完成或失败时，去掉loading效果
    
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activityIndicator stopAnimating];
    UIView *view = (UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_activityIndicator stopAnimating];
    UIView *view = (UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
