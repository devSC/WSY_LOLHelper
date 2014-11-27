//
//  RuneViewController.m
//  小米助手
//
//  Created by CC&DD on 14-3-28.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "RuneViewController.h"
#import "RuneMode.h"
#import "RuneCell.h"
#import "WXBaseModel.h"
#import "JSONKit.h"
#import "TopView.h"

@interface RuneViewController ()

@end

@implementation RuneViewController

- (void)dealloc
{
    [_toolbar release];
    [_pickerArray release];
    [_bigAreaLabel release];
    [_topView release];
    [_tableView release];
    [_pickerView release];
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
    [self initSubview];
}

//初始化子视图
- (void)initSubview
{
    TopView *topBarView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    [topBarView.backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [topBarView.nameLabel setText:nil];
    [topBarView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:topBarView];
    [topBarView release];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width,self.view.bounds.size.height - 64)];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];

    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(135, 20, 50,44)];
    [button setTitle:@"符文" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:button];
    [button release];
    
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, -60, 320, 60)];
    [self.view addSubview:_topView];
    
    _bigAreaLabel = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 300, 30)];
    [_bigAreaLabel setBackgroundColor:[UIColor orangeColor]];
    [_bigAreaLabel setAllowsEditingTextAttributes:YES];
    [_bigAreaLabel setTextAlignment:NSTextAlignmentCenter];
    _bigAreaLabel.borderStyle = UITextBorderStyleRoundedRect;
    [_topView addSubview:_bigAreaLabel];
    
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_doneButton setFrame:CGRectMake(self.view.bounds.size.width - 70, 5, 60, 44)];
    [_doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [_doneButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_doneButton addTarget:self action:@selector(doneButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancleButton setFrame:CGRectMake(10, 5, 80, 44)];
    [_cancleButton setTitle:@"Cancle" forState:UIControlStateNormal];
    [_cancleButton addTarget:self action:@selector(cancleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_cancleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_toolbar addSubview:_doneButton];
    [_toolbar addSubview:_cancleButton];
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 568, 320, 200)];
    [self.view addSubview:_pickerView];
    _bigAreaLabel.inputView = _pickerView;
    _bigAreaLabel.inputAccessoryView = _toolbar;
    
    _bigAreaLabel.delegate = self;
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [self hardCodes];
}
- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
 
}

- (void)hardCodes
{
    NSArray *array1 = @[@"符印", @"标记", @"雕文", @"精华"];
    NSArray *array2 = @[@"一级", @"二级", @"三级"];
    _pickerArray = [@[array1, array2] retain];
}

- (void)buttonAction
{
    __block UIView *view = _topView;
    [UIView animateWithDuration:.7f animations:^(void){
        [view setFrame:CGRectMake(0, 64, 320, 60)];
    } completion:^(BOOL finished){
        
    }];
    
}

#pragma mark -
#pragma mark pickerView delegate and datasource method
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *array =[_pickerArray objectAtIndex:component];
    return [array count];
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[_pickerArray objectAtIndex:component] objectAtIndex:row];
}

- (IBAction)cancleButtonAction:(id)sender {
    [_bigAreaLabel endEditing:YES];
}

- (IBAction)doneButtonAction:(id)sender {
    NSInteger row = [self.pickerView selectedRowInComponent:1];
    NSInteger row2 = [self.pickerView selectedRowInComponent:0];
    NSString *string = [[_pickerArray objectAtIndex:0] objectAtIndex:row2];
    NSString *string2 = [[_pickerArray objectAtIndex:1] objectAtIndex:row];
    _bigAreaLabel.text = [NSString stringWithFormat:@"%@%@", string, string2];
    [_bigAreaLabel endEditing:YES];
    
    //编辑完成后完成数据
     __block UIView *view = _topView;
    [UIView animateWithDuration:0.3f animations:^(void){
        [view setFrame:CGRectMake(0, - 64, 320, 60)];
    } completion:^(BOOL finished){
        
    }];
    [self getUrlContentStringWithString1:string string2:string2];
}

//从网络请求数据
- (void)getUrlContentStringWithString1: (NSString *)string string2: (NSString *)string2
{
    NSDictionary *dic = @{@"符印": @"seal", @"标记": @"mark", @"雕文": @"glyph", @"精华": @"quintessence"};
    NSDictionary *dic2 = @{@"一级": @"1", @"二级": @"2", @"三级": @"3"};
    
    NSString *tagString = [dic objectForKey:string];
    NSString *tierString = [dic2 objectForKey:string2];
    
    NSString *urlString = [NSString stringWithFormat: kRuneInfo, tagString, tierString];
    NSError *error = nil;
    NSString *content = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"RuneError: %@", [error localizedDescription]);
    }
    NSDictionary *contentDic = [content objectFromJSONString];
    NSArray *array = [contentDic objectForKey:@"result"];

    _dataArray = [[self hardCodeWithArray:array] retain];
    [_tableView reloadData];
}

- (NSArray *)hardCodeWithArray: (NSArray *)array
{
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSString *nameString = [dic objectForKey:@"name"];
        NSString *iconString = [dic objectForKey:@"icon"];
        NSString *description = [dic objectForKey:@"description"];
        RuneMode *model = [[[RuneMode alloc] initRuneModelWithIconUrlString:iconString nameString:nameString decrString:description] autorelease];
        [mArray addObject:model];
    }
    return [[mArray retain] autorelease];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}



@end
