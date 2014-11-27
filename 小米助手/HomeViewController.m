//
//  HomeViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-14.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "HomeViewController.h"
#import "FirstViewController.h"
#import "RootView.h"
#import "NetAPI.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"战斗力查询";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
}

- (void)loadView
{
    [super loadView];
    _goView = YES;
    _rootView = [RootView initWithView];
    [_rootView setFrame:CGRectMake(0, 64, 320, SCREENHEIGHT - 64 - 44)];
    [self.view addSubview:_rootView];
    [_rootView.goButton addTarget:self action:@selector(goButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [_rootView release];
}

//发送网络请求,切换视图控制器
- (IBAction)goButtonAction:(id)sender {
    NSString *nameString = _rootView.nameLabel.text;
    NSString *bigAreaString = _rootView.bigAreaLabel.text;
    for (NSDictionary *dic in _rootView.pickDicArray) {
        if ([[dic.allKeys objectAtIndex:0] isEqualToString:bigAreaString]) {
            bigAreaString = [dic objectForKey:bigAreaString];
            break;
        }
    }
    [self showAlertViewWithBigAreaStringLength:bigAreaString.length nameStringlength:nameString.length];
    if (_goView) {
        FirstViewController *firstViewController = [[FirstViewController alloc] init];
        [self.navigationController pushViewController:firstViewController animated:YES];
        firstViewController.nameString = nameString;
        firstViewController.server = bigAreaString;
        [firstViewController release];
    }
    _goView = YES;
    
}

- (void)showAlertViewWithBigAreaStringLength: (CGFloat)bigAreaStringLength
                            nameStringlength: (CGFloat)nameStringlength
{
    //提示信息
    if (!bigAreaStringLength && !nameStringlength) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请输入召唤师名称和服务器名称"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles: nil];
        [alertView show];
        [alertView release];
        _goView = NO;
    }
    else if (!nameStringlength) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请输入召唤师名称"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles: nil];
        [alertView show];
        [alertView release];
        _goView = NO;
        
    }
    else if (!bigAreaStringLength) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请输入服务器名称"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles: nil];
        [alertView show];
        [alertView release];
        _goView = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
