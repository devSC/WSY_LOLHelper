//
//  NewsViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-14.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "NewsViewController.h"
#import "CCSegmentedControl.h"
#import "MyScrollView.h"
#import "WXBaseModel.h"
#import "NewCustomCell.h"
#import "MJRefreshFooterView.h"
#import "MJRefreshHeaderView.h"
#import "RTSpinKitView.h"
#import "DetailNewsViewController.h"
#import "MyScrollViewButton.h"

@interface NewsViewController ()
{
    BOOL _lock;
}
@property (nonatomic, assign) int page;

@property (nonatomic, retain) UIView *panelView;    //指示视图承载容器
@end

@implementation NewsViewController

- (void)dealloc
{
    [_recommArray release];
    [_resultArray release];
    [_myScorollView release];
    [_refreshFoot release];
    [_refreshHeader release];
    [_spinKitView release];
    
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"资讯";
        self.resultArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    CCSegmentedControl *segmentedControl = [[CCSegmentedControl alloc] initWithItems:@[@"最新", @"官方", @"视频", @"出装", @"排名"]];
    segmentedControl.frame = CGRectMake(0, 64, self.view.bounds.size.width,  30);
    //设置背景图片，或者设置颜色，或者使用默认白色外观
    segmentedControl.backgroundImage = [UIImage imageNamed:@"segment_bg.png"];
    //segmentedControl.backgroundColor = [UIColor grayColor];
    //阴影部分图片，不设置使用默认椭圆外观的stain
    segmentedControl.selectedStainView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stain.png"]] autorelease];
    [self.view addSubview:segmentedControl];
    segmentedControl.selectedSegmentTextColor = [UIColor whiteColor];
    segmentedControl.segmentTextColor = [self colorWithHexString:@"#535353"];
    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl release];
    
    _page = 1;
    _lock = 1;

    //初始化轮播图
    _myScorollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 170)];
    [self.view addSubview:_myScorollView];
    [_myScorollView setAutoRunEnableWithInterval:7];
    _myScorollView.playDirection = Right;
    _myScorollView.timerInterval = 3;
    _myScorollView.pageControlEnabled = YES;
    [_myScorollView setUserInteractionEnabled:YES];
    [_myScorollView setMyBlock:^(NSString *Id){
        DetailNewsViewController *detailNew = [[DetailNewsViewController alloc] init];
        [self.navigationController pushViewController:detailNew animated:YES];
        detailNew.urlString = Id;
        [detailNew release];
    }];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 94, self.view.bounds.size.width, self.view.bounds.size.height - 94 - 44)];
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = _myScorollView;
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];

    _refreshHeader = [[MJRefreshHeaderView alloc] init];
    _refreshHeader.delegate = self;
    _refreshHeader.scrollView = self.tableView;
    //让其一进入就刷新
//    [_refreshHeader beginRefreshing];

    _panelView = [[UIView alloc] initWithFrame:_tableView.bounds];
    _panelView.backgroundColor = [UIColor colorWithRed:0.498 green:0.549 blue:0.553 alpha:1.0];
    _spinKitView = [[RTSpinKitView alloc] initWithStyle:RTSpinKitViewStyleWave color:[UIColor whiteColor]];
    _spinKitView.center = _panelView.center;
    [_panelView addSubview:_spinKitView];
    [self.view addSubview:_panelView];
    
    //添加上拉加载更多
    _refreshFoot = [[MJRefreshFooterView alloc] init];
    _refreshFoot.delegate = self;
    _refreshFoot.scrollView = self.tableView;
    [self hardLatestNewsCode];
}


//隐藏加载指示器
- (void)hideindicatorView
{
    _panelView.hidden = YES;
    [_spinKitView stopAnimating];
}

//用来切换新闻种类界面
- (void)valueChanged:(id)sender
{
    CCSegmentedControl* segmentedControl = (CCSegmentedControl *)sender;
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            break;
        default:
            break;
    }
}

- (void)hardLatestNewsCode
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if (!_lock) {
            [_resultArray removeAllObjects];
            _page = 1;
        }
        CGFloat osType = [[[UIDevice currentDevice] systemVersion] floatValue];
        NSString *urlString = [NSString stringWithFormat:kLatestNews, _page, osType];
        NSDictionary *dicData = [WXBaseModel getUrlStringContentWithUrlString:urlString];
        //获得轮播图资料
        _recommArray = [[dicData objectForKey:@"headerline"] retain];
        
        //获得tableView资料  //注意这里mutableArray不能直接用等号 ->会直接变为不可变数组
        for (NSDictionary *dic in [dicData objectForKey:@"data"]) {
            [_resultArray addObject: dic];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            //隐藏
            [self hideindicatorView];
             [_myScorollView setUrlStringArray:_recommArray];
            [_tableView reloadData];
            _page++;
        });
        
    });
}


- (void)doneWithView:(MJRefreshBaseView *)refreshView
{
    // 刷新表格
    [self.tableView reloadData];
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [refreshView endRefreshing];
}

#pragma mark - 刷新控件的代理方法
#pragma mark 开始进入刷新状态

#pragma mark 开始刷新
- (void)beginRefreshing
{
    if (self.view.window) {
        [self setState:MJRefreshStateRefreshing];
    } else {
        _state = MJRefreshStateWillRefreshing;
    }
}
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView == _refreshFoot) {
        CGFloat osType = [[[UIDevice currentDevice] systemVersion] floatValue];
        NSString *urlString = [NSString stringWithFormat:kLatestNews, _page, osType];
        NSDictionary *dicData = [[WXBaseModel getUrlStringContentWithUrlString:urlString] retain];
        //获得tableView资料
        NSArray *refreshArray = [dicData objectForKey:@"data"];
        for (int i = 0; i < refreshArray.count; i++) {
            NSMutableDictionary *mDic = [refreshArray objectAtIndex:i];
            [self.resultArray addObject:mDic] ;
        }
        _page ++;
    }
    else
    {
        _lock = NO;
        [self hardLatestNewsCode];
    }
    // 2.2秒后刷新表格UI
    [self performSelector:@selector(doneWithView:) withObject:refreshView afterDelay:2.0];
}

#pragma mark 刷新完毕
- (void)refreshViewEndRefreshing:(MJRefreshBaseView *)refreshView
{
    NSLog(@"%@----刷新完毕", refreshView.class);
}

#pragma mark 监听刷新状态的改变
- (void)refreshView:(MJRefreshBaseView *)refreshView stateChange:(MJRefreshState)state
{
    switch (state) {
        case MJRefreshStateNormal:
            NSLog(@"%@----切换到：普通状态", refreshView.class);
            break;
            
        case MJRefreshStatePulling:
            NSLog(@"%@----切换到：松开即可刷新的状态", refreshView.class);
            break;
            
        case MJRefreshStateRefreshing:
            NSLog(@"%@----切换到：正在刷新状态", refreshView.class);
            break;
        default:
            break;
    }
}



#pragma mark -
#pragma mark tableview delegate method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_resultArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    NewCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[NewCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    [cell setDic:[_resultArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_resultArray objectAtIndex:indexPath.row];
    NSString *string = [dic objectForKey:@"id"];
    DetailNewsViewController *detailNew = [[DetailNewsViewController alloc] init];
    [self.navigationController pushViewController:detailNew animated:YES];
    detailNew.urlString = string;
    [detailNew release];

}

#pragma mark -
#pragma mark - CCSegmentedMethod
//加颜色
- (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

- (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
