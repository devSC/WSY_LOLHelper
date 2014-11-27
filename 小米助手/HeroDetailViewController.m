//
//  HomeViewController.m
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "CCSegmentedControl.h"
#import "HeroDetailView.h"
#import "VidepWebViewController.h"
#import "DressViewController.h"
#import "WebViewController.h"

#import "JSONKit.h"
#import "NetApi.h"

#import "BaseCell.h"
#import "UserInfo.h"

#import "UserInfo2.h"
#import "VideoModel.h"

#import "DressModel.h"
#import "DressCell.h"

@interface HeroDetailViewController ()
@property (nonatomic, assign) NSInteger selectSeg;

@end

@implementation HeroDetailViewController

- (void)dealloc
{
    [_heroId release];
    [_dic release];
    [_detailView release];
    [_heroEname release];
    [_skillIconArray release];
    [_topImageUrl release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _skillIconArray = [[NSMutableArray array] retain];
        
    }
    return self;
}

//初始化技能页面数据
- (NSArray *)hardCode
{
    if (_dic == nil) {
        [self getHeroDetailInfoWithID:_heroId];
    }
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in [self skillDataWithArray]) {
        //获取技能图标网址
        [_skillIconArray addObject:[dic objectForKey:@"img"]];
        UserInfo *u1 = [[[UserInfo alloc] initWithImageUrl:[dic objectForKey:@"img"] skillName:[dic objectForKey:@"name"] content:[dic objectForKey:@"desc"] userExperience:[dic objectForKey:@"use_of_experience"]] autorelease];
        [array addObject:u1];
    }
    return [[array retain] autorelease];
}
//获取英雄背景数据
- (NSArray *)hardCode2
{
    NSDictionary *dic = [_dic objectForKey:@"result"];
    NSString *backString = [dic objectForKey:@"background"];
    NSString *analyString = [dic objectForKey:@"analyse"];
    UserInfo2 *userInfo = [[[UserInfo2 alloc] initWithAnalyseString:analyString BackGroundString:backString] autorelease];
    NSMutableArray *array = [NSMutableArray arrayWithObject:userInfo];
    return [[array retain] autorelease];
}

//获取英雄视频数据
- (NSArray *)hardVideoCode
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in [self getVideoArrayWithHeroId]) {
        NSString *videoName = [dic objectForKey:@"name"];
        NSString *videoPlayCount = [NSString stringWithFormat:@"%@", [dic objectForKey:@"play_count"]];
        NSString *time = [NSString stringWithFormat:@"%.1f", [[dic objectForKey:@"score"] floatValue]];
        NSString *upDataTime = [NSString stringWithFormat:@"%@", [dic objectForKey:@"update_time"]];
        NSString *urlString = [self getVideoUrlStringWithDic:dic];
        VideoModel *videoModel = [[[VideoModel alloc] initWithVideoNameString:videoName playCountString:videoPlayCount timeString:time upDataTimeString:upDataTime  urlString:urlString] autorelease];
        [array addObject:videoModel];
    }
    return [[array retain] autorelease];
}


//获得播放视频网址 优先缓存高清
- (NSString *)getVideoUrlStringWithDic: (NSDictionary *)dic
{
    NSString *urlStringSuper = [NSString stringWithFormat:@"%@", [dic objectForKey:@"video_addr_super"]];
    NSString *urlStringHigh = [NSString stringWithFormat:@"%@", [dic objectForKey:@"video_addr_high"]];
    NSString *urlStringLow = [NSString stringWithFormat:@"%@", [dic objectForKey:@"video_addr"]];
    if (urlStringSuper.length != 0) {
        return urlStringSuper;
    }
    else if(urlStringHigh.length != 0) {
        return urlStringHigh;
    }
    else
    {
        return urlStringLow;
    }
}

//初始化视频数据
- (NSArray *)getVideoArrayWithHeroId
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:kVideoApi, _heroId]];
    NSError *error = nil;
    NSString *urlString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"hardVideoCodeError: %@", [error localizedDescription]);
    }
    NSDictionary *dic = [urlString objectFromJSONString];
    NSArray *array = [dic objectForKey:@"result"];
    return [[array retain] autorelease];
}

//获得英雄出装数据
- (NSArray *)hardHeroDressCode
{
    NSArray *dataArray = [self getHeroDressDataWithEname:_heroEname];
    NSMutableArray *arrays = [NSMutableArray array];
    for (NSDictionary *dic in dataArray) {
        NSString *name = [dic objectForKey:@"title"];
        NSString *time = [dic objectForKey:@"time"];
        NSString *author = [dic objectForKey:@"author"];
        NSString *combat = [dic objectForKey:@"combat"];
        NSString *gameType = [NSString stringWithFormat:@"[%@] ", [dic objectForKey:@"game_type"]];
        NSString *nameStr = [gameType stringByAppendingString:name];
        NSArray *array = [[dic objectForKey:@"end_cz"] componentsSeparatedByString:@","];
        DressModel *dressModel = [[DressModel alloc] initWithNameString:nameStr timeString:time authorString:author combatString:combat imageArray:array];
        [arrays addObject:dressModel];
        [dressModel release];
    }
    
    return [[arrays retain] autorelease];

}
//获得英雄详细数据
- (void)getHeroDetailInfoWithID: (NSString *)Id
{
    NSString *urlString = [NSString stringWithFormat:kHeroInfo,Id];
    NSError *error = nil;
    NSString *dataString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:&error];
    _dic = [[dataString objectFromJSONString] retain];
    NSDictionary *dic = [_dic objectForKey:@"result"];
    //获取top图地址
    _topImageUrl = [dic objectForKey:@"img_top"];
}

//返回技能数据
- (NSArray *)skillDataWithArray
{
    NSDictionary *dic = [_dic objectForKey:@"result"];
    _heroEname = [dic objectForKey:@"name_e"];
    return [[[dic objectForKey:@"skill"] retain] autorelease];
}

//获得英雄出装数据
- (NSArray *)getHeroDressDataWithEname: (NSString *)eName
{
    NSString *urlString = [NSString stringWithFormat:kDressApi, eName];
    NSString *content = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [content objectFromJSONString];
    return array;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    _selectSeg = -1;

    [self newThread];

    self.view.backgroundColor = [UIColor whiteColor];
    _detailView = [[HeroDetailView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_detailView];
    _detailView.tableView.delegate = self;
    _detailView.tableView.dataSource = self;
    [_detailView.backButton addTarget:self action:@selector(popToPriviousViewController) forControlEvents:UIControlEventTouchUpInside];
    
    CCSegmentedControl *segmentedControl = [[CCSegmentedControl alloc] initWithItems:@[@"技能", @"介绍", @"视频", @"出装", @"排名"]];
    segmentedControl.frame = CGRectMake(0, self.view.bounds.size.height - 348 -30, 320, 30);
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

}
- (void)popToPriviousViewController
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (void)newThread
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        switch (_selectSeg) {
            case -1:{
                [self setDataArray:[self hardCode]];
                [_detailView setDataDic:_dic];
            }break;
            case 0:{
                [self setDataArray:[self hardCode]];
            }break;
            case 1:{
                [self setDataArray:[self hardCode2]];
            }break;
            case 2:{
                [self setDataArray:[self hardVideoCode]];
            }break;
            case 3:{
                [self setDataArray:[self hardHeroDressCode]];
            }break;
            default:
                break;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [_detailView.tableView reloadData];
        });
    
    });
}


- (void)valueChanged:(id)sender
{
    CCSegmentedControl* segmentedControl = sender;
    _selectSeg = segmentedControl.selectedSegmentIndex;
    if (_selectSeg == 4) {
        WebViewController *webViewController = [[WebViewController alloc] init];
        [self.navigationController pushViewController:webViewController animated:YES];
        NSString *urlString = [NSString stringWithFormat:kBestHeroApi, _heroEname];
        webViewController.urlString = urlString;
        webViewController.ID = @"2";
        [webViewController release];
    }
    else
    {
    [self newThread];
    }
}
- (void)setDataArray: (NSArray *)array
{
    if (_dataArray != array) {
        [_dataArray release];
        _dataArray = [array retain];
    }
}


#pragma mark - 
#pragma mark - tableView delegate and method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectSeg == 2) {
        VideoModel *viewModel = [_dataArray objectAtIndex:indexPath.row];
        NSString *urlString = viewModel.urlString;
        VidepWebViewController *viewVC = [[VidepWebViewController alloc] init];
        [self.navigationController pushViewController:viewVC animated:YES];
        viewVC.urlString = urlString;
        [viewVC release];
    }
    if (_selectSeg == 3) {
        DressViewController *dressDetailViewController = [[DressViewController alloc] init];
        [self.navigationController pushViewController:dressDetailViewController animated:YES];
        NSArray *array = [self getHeroDressDataWithEname:_heroEname];
        [dressDetailViewController setDataDic:[array objectAtIndex:indexPath.row]];
        [dressDetailViewController setSkillArray:_skillIconArray];
        [dressDetailViewController setTopImageUrl:_topImageUrl];
        [dressDetailViewController release];
        
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     BaseCell *cell = [self tableView:_detailView.tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
