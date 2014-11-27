//
//  RuneViewController.h
//  小米助手
//
//  Created by CC&DD on 14-3-28.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import "BaseViewControllerCell.h"

@interface RuneViewController : BaseViewControllerCell<UIPickerViewDelegate, UITextFieldDelegate, UIPickerViewDataSource>

@property (retain, nonatomic) NSArray *pickerArray;
@property (retain, nonatomic) UIToolbar *toolbar;
@property (retain, nonatomic) UITextField *bigAreaLabel;
@property (retain, nonatomic) UIPickerView *pickerView;
@property (retain, nonatomic) UIView *topView;
@property (retain, nonatomic) UITableView *tableView;


@property (retain, nonatomic) UIButton *doneButton;
@property (retain, nonatomic) UIButton *cancleButton;

@end
