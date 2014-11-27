//
//  BaseViewController.m
//  MyTextCellFactory
//
//  Created by CC&DD on 14-1-16.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseViewControllerCell.h"
#import "MyCell.h"
#import "CellFactory.h"
#import "DressDetailCell.h"
#import "GoodsDetailViewController.h"


@interface BaseViewControllerCell ()

@end

@implementation BaseViewControllerCell

- (void)dealloc
{
    [_dataArray release];
    [super dealloc];
}

- (NSArray *)hardCode
{
    return nil;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark tableview delegate method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*-------------------------------------------
     *获取每一行对应的数据
     *------------------------------------------*/
    BaseModel *baseModel = [_dataArray objectAtIndex:indexPath.row];
    
    /*-------------------------------------------
     *获取每一行对应的cell类型
     *------------------------------------------*/
    Class myClass = [CellFactory cellClassForModel:baseModel];

//    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([myClass class])];
    BaseCell *cell = [CellFactory cellForModel:baseModel reuseabledIdentifier:NSStringFromClass([myClass class])];
    if ([myClass isSubclassOfClass:[DressDetailCell class]]) {
        DressDetailCell *cells = (DressDetailCell *)cell;
        [cells setGoodsblock:^(NSString *num){
            GoodsDetailViewController *goosVC = [[GoodsDetailViewController alloc] init];
            [self.navigationController pushViewController:goosVC animated:YES];
            goosVC.goodsId = num;
            [goosVC release];
        
        }];
    }
    cell.selectedBackgroundView = [[[UIView alloc] init] autorelease];

    [cell setDateForCell:baseModel];
    
    return [[cell retain] autorelease];

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseModel *baseModel = [_dataArray objectAtIndex:indexPath.row];
    Class cellClass = [CellFactory cellClassForModel:baseModel];
    CGFloat height = [cellClass cellHeightForModel:baseModel];
    return height;

}
@end
