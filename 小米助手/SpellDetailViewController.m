//
//  SpellDetailViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "SpellDetailViewController.h"
#import "SpellModel.h"
#import "BaseCell.h"

#import "DetailView.h"
#import "TopView.h"

@interface SpellDetailViewController ()

@end

@implementation SpellDetailViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"技能详情";
    
    _dataArray = [[self hardCodes] retain];
    
    // Do any additional setup after loading the view.
    TopView *topView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topView];
    [topView setBackgroundColor:[UIColor orangeColor]];
    [topView.backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [topView.nameLabel setText:@"物品详情"];
    [topView release];
    
    _detailView = [[DetailView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 280)];
    _detailView.viewNumber = @"2";
    _detailView.dataDic = _dataDic;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _tableView.tableHeaderView = _detailView;
    
    [self.view addSubview:_tableView];
    

}
- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (NSArray *)hardCodes
{
    SpellModel *model = [[[SpellModel alloc] initSpellModelWithTitleString:@"技能介绍:"contentString:[_dataDic objectForKey:@"description"]] autorelease];
    SpellModel *model2 = [[[SpellModel alloc] initSpellModelWithTitleString:@"技能使用说明:" contentString:[_dataDic objectForKey:@"direction_of_use"]] autorelease];
    NSArray *array = [NSArray arrayWithObjects:model, model2, nil];
    return [[array retain] autorelease];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
