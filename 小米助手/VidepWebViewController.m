//
//  VidepWebViewController.m
//  TestMyCellF
//
//  Created by CC&DD on 14-3-26.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "VidepWebViewController.h"


@interface VidepWebViewController ()

@end

@implementation VidepWebViewController

- (void)dealloc
{
    [_MPPlayer release];
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
    self.view.backgroundColor = [UIColor blackColor];
    NSURL *url = [NSURL URLWithString:self.urlString];
    _MPPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    [_MPPlayer setFullscreen:YES animated:YES];
    [_MPPlayer.view setFrame:CGRectMake(0, 100, 320, 250)];
    [_MPPlayer setControlStyle:MPMovieControlStyleEmbedded];
    [self.view addSubview:_MPPlayer.view];
    [_MPPlayer play];
    
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 44, 44)];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    [backButton addTarget:self action:@selector(backBttonAction) forControlEvents:UIControlEventTouchUpInside];

}

- (void)backBttonAction
{
    [_MPPlayer stop];
    [self.navigationController popViewControllerAnimated:YES];
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
