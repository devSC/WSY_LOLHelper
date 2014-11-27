//
//  GoodsViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsCustomCell.h"
#import "GoodsDetailViewController.h"
#import "JSONKit.h"

#define kImageWidth 60 //UITableViewCell里面图片的宽度
#define kImageHeight 75//UITableViewCell里面图片的高度
#define kRowOfIconNumber 5 //每行的button个数

@interface GoodsViewController ()

@end

@implementation GoodsViewController

- (void)dealloc
{
    [_tableView release];
    [_dataArray release];
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
    self.title = @"所有物品";
    self.view.backgroundColor = [UIColor whiteColor];
    CGSize mSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenWidth = mSize.width;
    CGFloat screenHeight = mSize.height;
    
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStylePlain] autorelease];
    [self.view addSubview:_tableView];
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    _dataArray = [[self hardCode] retain];
}

- (NSArray *)hardCode
{
    NSError *error = nil;
    NSString *string =[NSString stringWithContentsOfURL:[NSURL URLWithString:_urlString] encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"GoosVCError:%@", [error localizedDescription]);
    }
    NSDictionary *dic = [string objectFromJSONString];
    NSArray *array = [dic objectForKey:@"result"];
    return [[array retain] autorelease];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITable datasource and delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count/kRowOfIconNumber + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    //自定义UITableGridViewCell，里面加了个NSArray用于放置里面的3个图片按钮
     GoodsCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[GoodsCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        cell.selectedBackgroundView = [[[UIView alloc] init] autorelease];
        [cell setBlock:^(NSString *name){
            GoodsDetailViewController *goodDetailViewController = [[GoodsDetailViewController alloc] init];
            [self.navigationController pushViewController:goodDetailViewController animated:YES];
            [goodDetailViewController release];
            goodDetailViewController.goodsId = name;
        }];
    }
    //通过range获取数据
    NSRange range;
    if (indexPath.row == (_dataArray.count/kRowOfIconNumber)) {
        range = NSMakeRange(indexPath.row*kRowOfIconNumber, _dataArray.count%kRowOfIconNumber);
    }
    else
    {
        range = NSMakeRange(indexPath.row*kRowOfIconNumber, kRowOfIconNumber);
    }
    NSArray *array = [_dataArray subarrayWithRange:range];
    [cell setButtonArray:[NSMutableArray arrayWithArray:array]];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kImageHeight + 5;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //不让tableviewcell有选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
