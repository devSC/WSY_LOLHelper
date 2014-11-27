//
//  MainViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-14.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DataStationViewController.h"
#import "NewsViewController.h"
#import "BaseNavigationController.h"
#import "MoreViewController.h"

//#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_tabBarView release];
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
    [self.tabBar setHidden:YES];
    [self initViewController];
    [self initTabBarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

//初始化视图控制器
- (void) initViewController
{
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    MessageViewController *messageViewController = [[MessageViewController alloc] init];
    DataStationViewController *dataViewController = [[DataStationViewController alloc] init];
    NewsViewController *newViewController = [[NewsViewController alloc] init];
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    
    NSArray *viewControllerArray = @[homeViewController, messageViewController, dataViewController, newViewController, moreViewController];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:5];
    for (UIViewController *viewController in viewControllerArray) {
        BaseNavigationController *baseNavigationController = [[BaseNavigationController alloc] initWithRootViewController:viewController];
        [viewControllers addObject:baseNavigationController];
        [baseNavigationController release];
    }
    self.viewControllers = viewControllers;
    [homeViewController release];
    [messageViewController release];
    [dataViewController release];
    [newViewController release];
    [moreViewController release];
}

//创建自定义tabBar
- (void) initTabBarView
{
//    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT - 49, 320, 49)];
//    [_tabBarView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_bar_bg@2x"]]];
    [_tabBarView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:_tabBarView];

    NSArray *imageArray = @[@"tab_btn_nor1@2x", @"tab_btn_nor2@2x", @"tab_btn_nor4@2x", @"tab_btn_nor0@2x", @"tab_btn_nor5@2x"];
    NSArray *heightImageArray = @[@"tab_btn_sel1@2x", @"tab_btn_sel2@2x", @"tab_btn_sel4@2x", @"tab_btn_sel0@2x", @"tab_btn_sel5@2x"];

    for (int i = 0; i < imageArray.count; i++) {
        NSString *backImage = [imageArray objectAtIndex:i];
        NSString *heightImage = [heightImageArray objectAtIndex:i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake((64-30)/2+(i*64), (49-30)/2, 30, 30)];
        [button setTag:i];
        [button setImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];;
        [button setImage:[UIImage imageNamed:heightImage] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:button];
    }
}

//视图控制器的切换
- (void)selectedTab: (UIButton *)button
{
    self.selectedIndex = button.tag;
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
