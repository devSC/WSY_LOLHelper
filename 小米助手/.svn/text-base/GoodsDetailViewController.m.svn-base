//
//  GoodsDetailViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-27.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "GoodsDetailViewController.h"
#import "DetailView.h"
#import "TopView.h"
#import "JSONKit.h"
#import "BaseCell.h"

//共用一个Model类型
#import "DressDetailModel.h"


@interface GoodsDetailViewController ()

@end

@implementation GoodsDetailViewController

- (void)dealloc
{
    [_tableView release];
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
    self.view.backgroundColor = [UIColor greenColor];
    
    TopView *topView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:topView];
    [topView.backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [topView.nameLabel setText:@"物品详情"];
    [topView release];
    
    _detailView = [[DetailView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height - 64)];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setScrollEnabled:NO];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _tableView.tableHeaderView = _detailView;
    [self.view addSubview:_tableView];
    
    _dataArray = [[self hardCodes] retain];

}
- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
}

//组装数据
- (NSArray *)hardCodes
{
    NSError *error = nil;
    NSString *urlContent = [NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:kGoodsInfo, _goodsId]] encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"GoodsDetailVC error: %@", [error localizedDescription]);
    }
    NSDictionary *dic = [urlContent objectFromJSONString];
    
    NSDictionary *resultDic = [dic objectForKey:@"result"];
    _detailView.dataDic = resultDic;
    NSString *fromString = [NSString stringWithFormat:@"%@",[resultDic objectForKey:@"from"]];
    NSString *forString = [NSString stringWithFormat:@"%@",[resultDic objectForKey:@"for"]];
    NSArray *fromArray = nil;
    NSArray *forArray = nil;
    if (fromString.length != 0)
    {
         fromArray =[resultDic objectForKey:@"from"];
    }
    else
    {
        fromArray = nil;
    }
    if (forString.length != 0) {
       forArray = [resultDic objectForKey:@"for"];
    }
    else
    {
        forArray = nil;
    }
    NSString *content = [resultDic objectForKey:@"skill"];
    
    if (fromArray != nil && forArray != nil)
    {

        if (fromArray.count != 0 && forArray.count != 0)
        {
            DressDetailModel *model = [[[DressDetailModel alloc] initWithNameString:@"物品属性" lowString:nil imageArray:nil] autorelease];
            DressDetailModel *model1 = [[[DressDetailModel alloc] initWithNameString:@"由以下物品合成" lowString:nil imageArray:fromArray] autorelease];
            DressDetailModel *model2 = [[[DressDetailModel alloc] initWithNameString:@"可以合成以下物品" lowString:nil imageArray:forArray] autorelease];
            NSArray *array = [[NSArray alloc] initWithObjects:model, model1, model2, nil];
            return [array autorelease];

        }
        
    }
    if (fromArray.count == 0 && forArray.count != 0) {
        DressDetailModel *model = [[[DressDetailModel alloc] initWithNameString:@"物品属性" lowString:content imageArray:nil] autorelease];

        DressDetailModel *model2 = [[[DressDetailModel alloc] initWithNameString:@"可以合成以下物品" lowString:nil imageArray:forArray] autorelease];
        NSArray *array = [[NSArray alloc] initWithObjects:model, model2, nil];
        return [array autorelease];
    }
    else if(forArray.count == 0 && fromArray.count != 0)
    {
        DressDetailModel *model = [[[DressDetailModel alloc] initWithNameString:@"物品属性" lowString:content imageArray:nil] autorelease];

        DressDetailModel *model1 = [[[DressDetailModel alloc] initWithNameString:@"由以下物品合成" lowString:nil imageArray:fromArray] autorelease];
        NSArray *array = [[NSArray alloc] initWithObjects:model, model1, nil];
        return [array autorelease];
    }
    else
    {
        return nil;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
