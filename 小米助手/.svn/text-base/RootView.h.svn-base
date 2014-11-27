//
//  RootView.h
//  小米助手
//
//  Created by CC&DD on 14-3-15.
//  Copyright (c) 2014年 袁仕崇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootView : UIView<UIPickerViewDelegate, UITextFieldDelegate, UIPickerViewDataSource>

- (IBAction)cancleButtonAction:(id)sender;
- (IBAction)doneButtonAction:(id)sender;
@property (retain, nonatomic) NSArray *pickerArray;
@property (retain, nonatomic) NSArray *pickDicArray;
@property (retain, nonatomic) IBOutlet UIButton *goButton;
@property (retain, nonatomic) IBOutlet UIToolbar *toolbar;
@property (retain, nonatomic) IBOutlet UITextField *nameLabel;
@property (retain, nonatomic) IBOutlet UITextField *bigAreaLabel;
@property (retain, nonatomic) IBOutlet UIPickerView *pickerView;




- (void) initWithDelegate;
+ (RootView *) initWithView;
@end
