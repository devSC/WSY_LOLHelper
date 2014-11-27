//
//  ViewController.m
//  igridviewdemo
//
//  Created by vincent_guo on 13-12-12.
//  Copyright (c) 2013年 vincent_guo. All rights reserved.
//

#import "BlockViewController.h"
#import "UITableGridViewCell.h"
#import "UIImageButton.h"
#import "JSONKit.h"
#import "UIImageView+WebCache.h"
#import "HeroDetailViewController.h"
#import "CCSegmentedControl.h"

#define kImageWidth  70 //UITableViewCell里面图片的宽度
#define kImageHeight  100 //UITableViewCell里面图片的高度
#define kRowOfIconNumber 4
@interface BlockViewController ()

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation BlockViewController

- (void)dealloc
{
        NSLog(@"---%lu", self.retainCount);
    [_tableView release];
    [_dataArray release];
    
    [super dealloc];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    NSLog(@"---%lu", self.retainCount);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"所有英雄";
    self.view.backgroundColor = [UIColor whiteColor];
    CGSize mSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenWidth = mSize.width;
    CGFloat screenHeight = mSize.height;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self newThread];
}

- (void)newThread
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error = nil;
        NSString *urlString = [NSString stringWithContentsOfURL:[NSURL URLWithString:_urlString] encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            NSLog(@"ListTableViewError: %@", [error localizedDescription]);
        }
        _dataArray = [[[urlString objectFromJSONString] objectForKey:@"result"] retain];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    });
}

#pragma mark UITable datasource and delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count/4 + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    //自定义UITableGridViewCell，里面加了个NSArray用于放置里面的3个图片按钮
    UITableGridViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[UITableGridViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
       cell.selectedBackgroundView = [[[UIView alloc] init] autorelease];
        
        __block UINavigationController *navigationController = self.navigationController;
        [cell setBlock:^(NSString *name){
            HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
            [navigationController pushViewController:heroDetailVC animated:YES];
            heroDetailVC.heroId = name;
            
                [heroDetailVC release];

        
        }];
    }
    //通过range获取数据
    NSRange range;
    if (indexPath.row == (_dataArray.count/4)) {
        range = NSMakeRange(indexPath.row*kRowOfIconNumber, _dataArray.count%4);
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
