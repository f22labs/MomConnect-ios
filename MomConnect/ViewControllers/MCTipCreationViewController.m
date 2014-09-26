//
//  MCTipCreationViewController.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCTipCreationViewController.h"
#import "MCUtilities.h"
#import "SZTextView.h"
#import "MCNavigationBarManager.h"
#import "MCDataCenter.h"

@interface MCTipCreationViewController () <UITextViewDelegate>
{
    CGFloat mContentScrollHeight;
}

@property (nonatomic, strong) UIScrollView *bgScrollView;

@property (nonatomic, strong) SZTextView *textView;

@property (nonatomic, strong) UILabel *charCountLabel;
@property (nonatomic, strong) UIButton *clearButton;

@end

@implementation MCTipCreationViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"New Tip";
    [[MCNavigationBarManager sharedManager] applyPropertiesForPropertyKey:@"navbar-type1" toViewController:self withTitleView:nil];
    
    [self setupViews];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];
}

- (void)setupViews {
    
    [self.view addSubview:self.bgScrollView];
    
    self.charCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.charCountLabel.textColor = UIColorFromRGB(0x80858a);
    self.charCountLabel.font = [MCUtilities dinSystemAlternateBoldFontWithSize:15.0];
    self.charCountLabel.text = [NSString stringWithFormat:@"%d", TIP_COMPOSE_MAXIMUM_CHARS];
    [self.bgScrollView addSubview:self.charCountLabel];
    
    self.clearButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [self.clearButton.titleLabel setFont:[MCUtilities dinSystemAlternateBoldFontWithSize:15.0]];
    [self.clearButton setTitleColor:UIColorFromRGB(0x000) forState:UIControlStateNormal];
    [self.clearButton setTitleColor:UIColorFromRGB(0x80858a) forState:UIControlStateDisabled];
    self.clearButton.enabled = NO;
    [self.bgScrollView addSubview:self.clearButton];
    [self.clearButton addTarget:self action:@selector(clearClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.textView = [[SZTextView alloc] initWithFrame:CGRectZero];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.textColor = UIColorFromRGB(0x000);
    self.textView.layer.cornerRadius = 3.0;
    self.textView.clipsToBounds = YES;
    self.textView.delegate = self;
    self.textView.placeholder = @"Add the tip...";
    self.textView.keyboardType = UIKeyboardTypeTwitter;
    self.textView.font = [MCUtilities dinSystemAlternateBoldFontWithSize:15.0];
    [self.bgScrollView addSubview:self.textView];
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    CGFloat leftPadding = 15.0, topPadding = 15.0, rightPadding = 15.0;
    
    CGFloat xVal = leftPadding, yVal = topPadding;
    
    CGFloat availableWidth = CGRectGetWidth(self.view.bounds) - xVal - rightPadding;

    self.textView.frame = CGRectMake(xVal, yVal, availableWidth, 150.0);
    
    self.charCountLabel.frame = CGRectMake(CGRectGetMinX(self.textView.frame), CGRectGetMaxY(self.textView.frame) + 5.0, 50, 20);
    
    [self.clearButton sizeToFit];
    self.clearButton.frame = CGRectMake(CGRectGetMaxX(self.textView.frame) - self.clearButton.frame.size.width,  CGRectGetMaxY(self.textView.frame) + 5.0, self.clearButton.frame.size.width, self.clearButton.frame.size.height);
}

#pragma mark Getters

- (UIScrollView *)bgScrollView {
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _bgScrollView.backgroundColor = [UIColor clearColor];
        _bgScrollView.scrollEnabled = NO;
    }
    return _bgScrollView;
}

- (void)cancelBtnClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -


- (void)clearClicked:(id)sender {
    // clear text view.
    self.textView.text = @"";
    self.charCountLabel.text = [NSString stringWithFormat:@"%d", TIP_COMPOSE_MAXIMUM_CHARS];
}


#pragma mark - NavigationBar Buttons

- (void)enableDoneButton:(BOOL)enable {
    UIBarButtonItem *doneBtn = self.navigationItem.rightBarButtonItems[0];
    doneBtn.enabled = enable;
}

- (void)doneBtnClicked:(id)sender {
    
    //POST /tips parameters are what: "eat your food" and when: 19 (it means on 19th  day from coneption)
    [[MCDataCenter sharedCenter] getResponseWithUrlEndPoint:@"tips/" urlParameters:@{@"what":self.textView.text, @"when":@""} requestType:PostRequestType successBlock:^(id response) {
        
        NSLog(@"response: %@",response);
        
    } failureBlock:^(NSError *error) {
        NSLog(@"error: %@",error.description);
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    
    if (textView == self.textView) {

        NSUInteger currentCount = textView.text.length;
        
        if (currentCount > 0) {
            self.clearButton.enabled = YES;
            [self enableDoneButton:YES];
        }
        else {
            [self enableDoneButton:NO];
            self.clearButton.enabled = NO;
        }
        if (currentCount > TIP_COMPOSE_MAXIMUM_CHARS) {
            NSString *possibleTitle = [textView.text substringWithRange:NSMakeRange(0, TIP_COMPOSE_MAXIMUM_CHARS)];
            [self.textView setText:possibleTitle];
        }
        // Update char count label
        self.charCountLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)TIP_COMPOSE_MAXIMUM_CHARS - self.textView.text.length];
    }
}

@end
