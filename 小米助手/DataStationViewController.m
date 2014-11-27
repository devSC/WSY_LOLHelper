//
//  DataStationViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-14.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "DataStationViewController.h"
#import "DataStationView.h"
#import "DetailViewCell.h"
#import "WXBaseModel.h"

#import "BlockViewController.h"
#import "GoodsViewController.h"
#import "SpellViewController.h"
#import "RuneViewController.h"

@interface DataStationViewController ()

@end

@implementation DataStationViewController

- (void)dealloc
{
    [_dataArray release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"资料站";
        _dataArray = [[WXBaseModel returnDataStationViewInfo] retain];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    DataStationView *dataView = [DataStationView initDataStationView];
    [dataView setFrame:CGRectMake(0, 0, 320, 568)];
    [dataView.tableView setDelegate:self];
    [dataView.tableView setDataSource:self];
    [self.view addSubview:dataView];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    DetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[DetailViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
    [cell.listName setText:[[dic allKeys] firstObject]];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
        BlockViewController *listViewController = [[BlockViewController alloc] init];
        [self.navigationController pushViewController:listViewController animated:YES];
        listViewController.urlString = [dic objectForKey:@"全部英雄"];
        [listViewController release];
    }
    else if (indexPath.row == 1)
    {
        NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
        GoodsViewController *goodsViewController = [[GoodsViewController alloc] init];
        [self.navigationController pushViewController:goodsViewController animated:YES];
        goodsViewController.urlString = [dic objectForKey:@"所有物品"];
        [goodsViewController release];
    }
    else if (indexPath.row == 2)
    {
        NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
        SpellViewController *spellViewController = [[SpellViewController alloc] init];
        [self.navigationController pushViewController:spellViewController animated:YES];
        self.navigationController.navigationBarHidden = NO;
        spellViewController.urlString = [dic objectForKey:@"召唤师技能"];
        [spellViewController release];
    }
    else if (indexPath.row == 3)
    {
        RuneViewController *runeViewController = [[RuneViewController alloc] init];
        [self.navigationController pushViewController:runeViewController animated:YES];
        [runeViewController release];
    }
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
