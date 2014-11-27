//
//  FirstViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-15.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "FirstViewController.h"
#import "UserTopView.h"
#import "UserUnderView.h"
#import "ZdlCustomCell.h"
#import "ZdlView.h"
#import "UIImageView+WebCache.h"
#import "WebViewController.h"
#import "CCSegmentedControl.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)dealloc
{
    [_zdlView release];
    [_dataArray release];
    [_userInfoArray release];
    [_nameString release];
    [_server release];
    
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
//    [super viewDidLoad];
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:@"返回" forState:UIControlStateNormal];
//    [button setFrame:CGRectMake(10, 0, 44, 44)];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *array= @[self.nameString, self.server];
    UserTopView *topView = [UserTopView initTopView];
    [topView setFrame:CGRectMake(self.view.bounds.origin.x, 64, self.view.bounds.size.width, 240)];
    topView.serverString = self.server;
    topView.nameString = self.nameString;
    [self.view addSubview:topView];
    
    _underView = [UserUnderView initUnderView];
    [_underView setFrame:CGRectMake(0, 64 + 240, self.view.bounds.size.width, self.view.bounds.size.height - 200 - 44)];
    _underView.array = array;
    
    [self initZdlView];
    [self.view addSubview:_underView];
    
    //这里一定要先获取各自的对象,然后再对其声明为__block
    /*
     如果直接用[self.view addSubView:top1view]
     block方法为了保证其对象的安全性,会将self.view
     对象和_zdlView 各retain+1, 造成页面无法被释放.
     */
    __block ZdlView *top1View = _zdlView;
    __block UIView *myView = self.view;
    
    [topView setSegString:^(NSInteger index){
        switch (index) {
            case 0:{
                [top1View removeFromSuperview];
            }break;
            case 1:{
                [myView addSubview:top1View];
            }break;
            default:
                break;
        }
    }];
}


#pragma mark -
#pragma mark - buttonAction

- (void)initZdlView
{
    _zdlView = [[ZdlView alloc] init];
    [_zdlView setFrame:CGRectMake(0, 64 + 240, self.view.bounds.size.width, self.view.bounds.size.height - 200 - 44)];
    NSArray *array= @[self.nameString, self.server];
//    [self.view addSubview:_zdlView];
    _zdlView.tableView.delegate = self;
    _zdlView.tableView.dataSource = self;
    [self setUserInfoArray:array];

}

- (void)setUserInfoArray:(NSArray *)userInfoArray
{
    if (_userInfoArray != userInfoArray) {
        [_userInfoArray release];
        _userInfoArray = [userInfoArray retain];
    }
    [self getData];
    
}

//- (void)backButtonAction
//{
//    [self.navigationController popViewControllerAnimated:YES];
//    self.navigationController.navigationBarHidden = NO;
//    if (_myBlock) {
//        _myBlock();
//    }
//}

- (void)newThread
{
    [NSThread detachNewThreadSelector:@selector(getData) toTarget:self withObject:nil];
}
- (void)getData
{
    NSString *string = [self getUrlStringWithArray];
    _dataArray = [[self AnalyticalTitle:string] retain];
    NSLog(@"%lu", (unsigned long)[_dataArray retainCount]);
    
//    [self performSelectorOnMainThread:@selector(reloadDatas) withObject:self waitUntilDone:NO];
    
}
- (void)reloadDatas
{
    [_zdlView.tableView reloadData];
}
- (NSString *)getUrlStringWithArray
{
    NSString *name = [_userInfoArray objectAtIndex:0];
    NSString *server = [_userInfoArray objectAtIndex:1];
    NSString *urlString = [[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/matchList_ios.php?playerName=%@&serverName=%@&timestamp=1394714679.382660", name, server] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return urlString;
}


#pragma  userZDLinformation
- (NSMutableArray *)AnalyticalTitle:(NSString *)urlString{
    NSString *title=[NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
    NSRange range=[title rangeOfString:@"<ul class="];
    NSMutableString *needTidyString=[NSMutableString stringWithString:[title substringFromIndex:range.location+range.length]];
    NSRange rang2=[needTidyString rangeOfString:@"</ul>"];
    NSMutableString *html2=[NSMutableString stringWithString:[needTidyString substringToIndex:rang2.location]];
    NSArray *array = [html2 componentsSeparatedByString:@"</li>"];
    NSMutableArray *arrays = [self getUrlArray:array];
    return [[arrays retain] autorelease];
}

- (NSMutableArray *)getUrlArray:(NSArray *)array{
    NSMutableArray *titleArray=[[NSMutableArray alloc] init];
    NSInteger count = 0;
    for (NSString *title in array)
    {
        if (count > 50)
        {
            break;
        }
        else
        {
            NSString *typicalSting = [self getTypicalString:title];
            NSString *wOrLoString = [self getWorLoString:title];
            NSString *iconUrlString = [self getImageUrlString:title];
            NSString *nextViewString = [self getNextViewUrlString:title];
            NSString *timeString = [self getTimeString:title];
            NSDictionary *dic = @{@"iconUrl": iconUrlString, @"typical": typicalSting, @"wOrLo": wOrLoString, @"time": timeString, @"detailUrl": nextViewString};
            [titleArray addObject:dic];
        }
        count++;
    }
   // count = 0;
    
    return [titleArray autorelease];
}
//返回ICON图片路径
- (NSString *)getImageUrlString: (NSString *)title
{
    NSRange range=[title rangeOfString:@"<img src="];
    NSMutableString *needTidyString=[NSMutableString stringWithString:[title substringFromIndex:range.location+range.length]];
    NSRange rang2=[needTidyString rangeOfString:@"alt"];
    NSMutableString *html2=[NSMutableString stringWithString:[needTidyString substringToIndex:rang2.location]];
    NSArray *arrays = [html2 componentsSeparatedByString:@"\""];
//    NSLog(@"iconUrl: %@",[arrays objectAtIndex:1]);
    return [arrays objectAtIndex:1];
}
//返回详细页面字符串
- (NSString *)getNextViewUrlString: (NSString *)title
{
    NSRange range=[title rangeOfString:@"<li onclick="];
    NSMutableString *needTidyString=[NSMutableString stringWithString:[title substringFromIndex:range.location+range.length]];
    NSRange rang2=[needTidyString rangeOfString:@">"];
    NSMutableString *html2=[NSMutableString stringWithString:[needTidyString substringToIndex:rang2.location]];
    NSArray *array = [html2 componentsSeparatedByString:@"'"];
//    NSLog(@"nextView: %@",[array objectAtIndex:1]);
    return [array objectAtIndex:1];
    
}
//返回对战类型
- (NSString *)getTypicalString: (NSString *)title
{
    NSRange range=[title rangeOfString:@"<span class=\"col2 col\">"];
    NSMutableString *needTidyString=[NSMutableString stringWithString:[title substringFromIndex:range.location+range.length]];
    NSRange rang2=[needTidyString rangeOfString:@"</span>"];
    NSMutableString *html2=[NSMutableString stringWithString:[needTidyString substringToIndex:rang2.location]];
    return html2;
}
//返回输赢
- (NSString *)getWorLoString: (NSString *)title
{
    NSRange range = [title rangeOfString:@"<span class=\"col3 col"];
    NSMutableString *needTidyString=[NSMutableString stringWithString:[title substringFromIndex:range.location+range.length]];
    NSRange rang2=[needTidyString rangeOfString:@"</span>"];
    NSMutableString *html2=[NSMutableString stringWithString:[needTidyString substringToIndex:rang2.location]];
    NSArray *array = [html2 componentsSeparatedByString:@">"];
    NSString *string = [array objectAtIndex:1];
//    NSLog(@"WorLo: %@", string);
    return string;
}
//返回比赛时间
- (NSString *)getTimeString: (NSString *)title
{
    NSRange range=[title rangeOfString:@"<span class=\"month\">"];
    NSMutableString *needTidyString=[NSMutableString stringWithString:[title substringFromIndex:range.location+range.length]];
    NSRange rang2=[needTidyString rangeOfString:@"</span>"];
    NSMutableString *html2=[NSMutableString stringWithString:[needTidyString substringToIndex:rang2.location]];
//    NSLog(@"Time: %@", html2);
    return html2;
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    ZdlCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[ZdlCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
    NSString *iconUrl = [dic objectForKey:@"iconUrl"];
    [cell.iconImage setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:@"icon_for_enable@2x"]];
    cell.typical.text = [dic objectForKey:@"typical"];

    cell.wOrLo.text = [dic objectForKey:@"wOrLo"];
    if ([cell.wOrLo.text isEqualToString:@"胜利"]) {
        [cell.wOrLo setTextColor:[UIColor greenColor]];
    }
    else
    {
        [cell.wOrLo setTextColor:[UIColor redColor]];
    }
    cell.time.text = [dic objectForKey:@"time"];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *webViewController = [[WebViewController alloc] init];
    [self.navigationController pushViewController:webViewController animated:YES];
    NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
    webViewController.urlString = [dic objectForKey:@"detailUrl"];
    [webViewController release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
