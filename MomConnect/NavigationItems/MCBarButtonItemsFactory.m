//
//  MCBarButtonItemsFactory.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCBarButtonItemsFactory.h"
#import "MCAppConstants.h"
#import "MCUtilities.h"

@implementation MCBarButtonItemsFactory

- (UIBarButtonItem *)barButtonItemForDictionary:(NSDictionary *)navBarDict forViewController:(UIViewController *)viewController {
    SEL methodName = NSSelectorFromString([navBarDict[@"key"] stringByAppendingString:@"WithProperties:forViewController:"]);
    if ([self respondsToSelector:methodName]) {
        SuppressPerformSelectorLeakWarning(
             return (UIBarButtonItem *)[self performSelector:methodName withObject:navBarDict[@"layoutProperties"] withObject:viewController];
        );
    }
    return nil;
}

#pragma mark - BarButtonItems

- (UIBarButtonItem *)cancelBtnWithProperties:(NSDictionary *)properties forViewController:(UIViewController *)viewController {
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] init];
    cancelButton.image = [UIImage imageNamed:@"cross"];
    cancelButton.target = viewController;
    SuppressPerformSelectorLeakWarning({
        cancelButton.action = @selector(cancelBtnClicked:);
    });
    return cancelButton;
}

- (UIBarButtonItem *)nextBtnWithProperties:(NSDictionary *)properties forViewController:(UIViewController *)viewController {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:143/255.0 green:142/255.0 blue:148/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[MCUtilities navBarTitleFont]];
    [button sizeToFit];
    SuppressPerformSelectorLeakWarning({
        [button addTarget:viewController action:@selector(nextBtnClicked:) forControlEvents:UIControlEventTouchUpInside]; 
    });
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] init];
    nextButton.customView = button;
    nextButton.enabled = NO;
    return nextButton;
}

- (UIBarButtonItem *)doneBtnWithProperties:(NSDictionary *)properties forViewController:(UIViewController *)viewController {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setTitle:@"Done" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:143/255.0 green:142/255.0 blue:148/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[MCUtilities navBarTitleFont]];
    [button sizeToFit];
    SuppressPerformSelectorLeakWarning({
         [button addTarget:viewController action:@selector(doneBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    });
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] init];
    nextButton.customView = button;
    nextButton.enabled = NO;
    return nextButton;
}

- (UIBarButtonItem *)emptyTextBtnWithProperties:(NSDictionary *)properties forViewController:(UIViewController *)viewController {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setTitle:@"   " forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:143/255.0 green:142/255.0 blue:148/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[MCUtilities navBarTitleFont]];
    [button sizeToFit];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] init];
    nextButton.customView = button;
    nextButton.enabled = YES;
    return nextButton;
}

- (UIBarButtonItem *)sendBtnWithProperties:(NSDictionary *)properties forViewController:(UIViewController *)viewController {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setTitle:@"Send" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:143/255.0 green:142/255.0 blue:148/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[MCUtilities navBarTitleFont]];
    [button sizeToFit];
    SuppressPerformSelectorLeakWarning({
        [button addTarget:viewController action:@selector(sendBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    });
    UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] init];
    sendButton.customView = button;
    sendButton.enabled = NO;
    return sendButton;
}

- (UIBarButtonItem *)saveBtnWithProperties:(NSDictionary *)properties forViewController:(UIViewController *)viewController {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button setTitle:@"Save" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:143/255.0 green:142/255.0 blue:148/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [button.titleLabel setFont:[MCUtilities navBarTitleFont]];
    [button sizeToFit];
    SuppressPerformSelectorLeakWarning({
        [button addTarget:viewController action:@selector(saveBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    });
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] init];
    saveButton.customView = button;
    saveButton.enabled = NO;
    return saveButton;
}

@end
