//
//  MCSubscribeViewController.m
//  MomConnect
//
//  Created by HariHaraSudhan on 27/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCSubscribeViewController.h"
#import "MCUtilities.h"
#import "PhoneField.h"
#import "MCAppConstants.h"
#import "MCNavigationBarManager.h"
#import "MCDataCenter.h"

#define START_HEIGHT 0

@interface MCSubscribeViewController () <UITextFieldDelegate>
{
    NSArray *_locale;
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *phoneField;
@property (nonatomic, strong) UIDatePicker *datePicker;
@end

@implementation MCSubscribeViewController

-(id)init{
    return [super init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _locale = @[@"English", @"Tamil",@"Hindi"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"+ Patient";

    [[MCNavigationBarManager sharedManager] applyPropertiesForPropertyKey:@"navbar-type4" toViewController:self withTitleView:nil];
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    
    
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(HOME_CELL_SPACING, 80+START_HEIGHT, width-2*HOME_CELL_SPACING, 40)];
    name.borderStyle = UITextBorderStyleRoundedRect;
    name.font = [MCUtilities dinSystemAlternateBoldFontWithSize:15.0];
    name.placeholder = @"Patient Name";
    name.autocorrectionType = UITextAutocorrectionTypeNo;
    name.keyboardType = UIKeyboardTypeDefault;
    name.returnKeyType = UIReturnKeyDone;
    name.clearButtonMode = UITextFieldViewModeWhileEditing;
    name.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    name.delegate = self;
    self.nameField = name;
    [self.view addSubview:name];
    
    
    UILabel *prefix = [[UILabel alloc] initWithFrame:CGRectMake(HOME_CELL_SPACING, 140+START_HEIGHT, 30, 40)];
    prefix.numberOfLines = 0;
    prefix.font = [MCUtilities dinSystemAlternateBoldFontWithSize:15.0];
    prefix.textAlignment = NSTextAlignmentCenter;
    prefix.textColor = [UIColor blackColor];
    [prefix setText:@"+91"];
    [self.view addSubview:prefix];
    
    UITextField *phone = [[UITextField alloc] initWithFrame:CGRectMake(HOME_CELL_SPACING+40, 140+START_HEIGHT, width-4*HOME_CELL_SPACING, 40)];
    phone.borderStyle = UITextBorderStyleRoundedRect;
    phone.font = [MCUtilities dinSystemAlternateBoldFontWithSize:15.0];
    phone.placeholder = @"Phone Number";
    phone.autocorrectionType = UITextAutocorrectionTypeNo;
    phone.keyboardType = UIKeyboardTypeDefault;
    phone.returnKeyType = UIReturnKeyDone;
    phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    phone.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    phone.delegate = self;
    phone.keyboardType = UIKeyboardTypeDecimalPad;
    self.phoneField = phone;
    [self.view addSubview:phone];

    
    UIPickerView *langPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(HOME_CELL_SPACING, 140+START_HEIGHT, width-2*HOME_CELL_SPACING, 40)];
    langPicker.dataSource = self;
    langPicker.delegate = self;
    [self.view addSubview:langPicker];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(HOME_CELL_SPACING, 280+START_HEIGHT, width-2*HOME_CELL_SPACING, 40)];
    [self.view addSubview:datePicker];
    datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker = datePicker;
    [self.view bringSubviewToFront:phone];
    
//    [[UILabel appearanceWhenContainedIn:[UITableView class], [UIDatePicker class],nil] setBackgroundColor:[UIColor redColor]];
//    [[UILabel appearanceWhenContainedIn:[UITableView class], [UIDatePicker class],nil] setTextColor:[UIColor yellowColor]];
//    [[UIButton appearanceWhenContainedIn:[UITableView class], [UIDatePicker class],nil] setBackgroundColor:[UIColor redColor]];
//    [[UIView appearanceWhenContainedIn:[UITableView class], [UIDatePicker class],nil] setBackgroundColor:[UIColor redColor]];

}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* tView = (UILabel*)view;
    if (!tView){
        tView = [[UILabel alloc] init];
            tView.font = [MCUtilities dinSystemAlternateBoldFontWithSize:15.0];
            tView.textAlignment = NSTextAlignmentCenter;
        
    }
    [tView setText:[_locale objectAtIndex:row]];

    return tView;
}

#pragma mark -

- (NSString *)getDateString {
    
    NSDate *date = [self.datePicker date];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

#pragma mark -

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSLog(@"textFieldDidEndEditing");
}



#pragma mark -

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _locale.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _locale[row];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (void)doneBtnClicked:(id)sender {
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    //POST /tips parameters are what: "eat your food" and when: 19 (it means on 19th  day from coneption)
    [[MCDataCenter sharedCenter] getResponseWithUrlEndPoint:@"users" urlParameters:@{@"user": @{@"phone_number":self.phoneField.text,@"date":[self getDateString],@"locale":@1}} requestType:PostRequestType successBlock:^(id response) {
        
        NSLog(@"response: %@",response);
        
        [self.navigationController popViewControllerAnimated:YES];
        
        self.navigationItem.rightBarButtonItem.enabled = YES;
        
    } failureBlock:^(NSError *error) {
        NSLog(@"error: %@",error.description);
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }];
}

@end
