//
//  MCBackNavigationButtonView.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCBackNavigationButtonView.h"
#import "MCAppConstants.h"

// Defines center's x co-ordinate value for button.
#define LEFT_MARGIN 25

@interface MCBackNavigationButtonView() {
    UIButton *mButton;
}
@end

@implementation MCBackNavigationButtonView

@synthesize target = mTarget;
@synthesize selector = mSelector;

- (id)initWithFrame:(CGRect)frame withTarget:(id)target selection:(SEL)selector {
    self = [super initWithFrame:frame];
        if (self) {
            self.target = target;
            self.selector = selector;
            mButton = [[UIButton alloc] initWithFrame:CGRectMake(-LEFT_MARGIN, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
            [self addSubview:mButton];
            [mButton addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
            [mButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
            [mButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateHighlighted];
            NSString *buttonTitle = BACK_BUTTON_TEXT;
            [mButton setTitle:buttonTitle forState:UIControlStateNormal];
            // Magic numbers do not change.
            CGFloat leftImageInsets = -12;
            CGFloat titleImageGap = -2;
            CGFloat titleTopInset = 2;
            [mButton setImageEdgeInsets:UIEdgeInsetsMake(0, leftImageInsets, 0, titleImageGap)];
            [mButton setTitleEdgeInsets:UIEdgeInsetsMake(titleTopInset, titleImageGap, 0, 0)];
            [mButton setTitleColor:[UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0] forState:UIControlStateNormal];
            [mButton setTitleColor:[UIColor colorWithRed:213.0/255.0 green:213.0/255.0 blue:213.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
        }
    return self;
}

#pragma mark - Click Event Handlers

- (void)onClickButton:(id)sender {
    if (mTarget && mSelector) {
        if ([mTarget respondsToSelector:mSelector]) {
            SuppressPerformSelectorLeakWarning (
            [mTarget performSelector:mSelector withObject:nil];
            );
        }
    }
}

#pragma mark - Overriden Methods

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    CGRect frame = CGRectMake(-LEFT_MARGIN, 0,
                              self.frame.size.width+LEFT_MARGIN,
                              self.frame.size.height);
    if (CGRectContainsPoint(frame, point)) {
        [mButton setHighlighted:YES];
        return mButton;
    }
    return nil;
}

@end
