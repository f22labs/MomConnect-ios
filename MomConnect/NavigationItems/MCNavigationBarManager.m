//
//  MCNavigationBarManager.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCNavigationBarManager.h"
#import "MCBarButtonItemsFactory.h"
#import "MCAppConstants.h"

@interface MCNavigationBarManager()

@property (nonatomic, strong)MCBarButtonItemsFactory *barItemsFactory;

@end

@implementation MCNavigationBarManager

#pragma mark - InitializationMethods.

+ (MCNavigationBarManager *)sharedManager {
    static MCNavigationBarManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.barItemsFactory = [[MCBarButtonItemsFactory alloc] init];
        self.barItemsFactory.manager = self;
    }
    return self;
}

#pragma mark - public methods

- (void)applyPropertiesForPropertyKey:(NSString *)propertyKey toViewController:(UIViewController *)viewController withTitleView:(UIView *)titleView {
    [self backButtonSettingsForViewController:viewController];
    if (titleView) {
        viewController.navigationItem.titleView = titleView;
    }
    NSDictionary *navBarDict = [self navBarDictForKey:propertyKey];
    NSArray *leftBarButtons = navBarDict[@"left"];
    NSArray *rightBarButtons = navBarDict[@"right"];
    [viewController.navigationItem setLeftBarButtonItems:[self barButtonsItemsFromDictionaryArr:leftBarButtons forViewController:viewController] animated:NO];
    [viewController.navigationItem setRightBarButtonItems:[self barButtonsItemsFromDictionaryArr:rightBarButtons forViewController:viewController] animated:NO];
}

#pragma mark - Utitility methods

- (NSArray *)barButtonsItemsFromDictionaryArr:(NSArray *)dictArr forViewController:(UIViewController *)viewController {
    NSMutableArray *barButtons = [NSMutableArray array];
    for (NSDictionary *dict in dictArr) {
        UIBarButtonItem *barButtonItem = [self.barItemsFactory barButtonItemForDictionary:dict forViewController:viewController];
        if (barButtonItem) {
            [barButtons addObject:barButtonItem];
        }
    }
    return [barButtons copy];
}

- (void)backButtonSettingsForViewController:(UIViewController*)viewController {
    [viewController.navigationController.navigationBar setBackIndicatorImage:
     [UIImage imageNamed:@"back_icon"]];
    [viewController.navigationController.navigationBar setBackIndicatorTransitionMaskImage:
     [UIImage imageNamed:@"back_icon"]];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:BACK_BUTTON_TEXT style:UIBarButtonItemStylePlain target:nil action:nil];
    viewController.navigationItem.backBarButtonItem = backItem;
}

#pragma-mark Navigation Bar methods.

- (NSDictionary *)navBarDictForKey:(NSString *)propertyKey {
    return [self navigationBarData][propertyKey];
}

- (NSDictionary *)navigationBarData {
    NSDictionary *navigationBarData = @{
                                        @"navbar-type1":@{                                                
                                                },
                                        @"navbar-type2":@{
                                                @"left":@[@{@"key":@"cancelBtn"}],
                                                @"right":@[@{@"key":@"nextBtn"}],
                                                },
                                        @"navbar-type3":@{
                                                 @"right":@[@{@"key":@"nextBtn"}],
                                                },
                                        @"navbar-type4":@{
                                                 @"right":@[@{@"key":@"doneBtn"}],
                                                },
                                        @"navbar-type5":@{
                                                @"right":@[@{@"key":@"emptyTextBtn"}],
                                                },
                                        @"navbar-type6":@{
                                                 @"left":@[@{@"key":@"cancelBtn"}],
                                                },
                                        @"navbar-type7":@{
                                                @"left":@[@{@"key":@"cancelBtn"}],
                                                @"right":@[@{@"key":@"doneBtn"}],
                                                },
                                        @"navbar-type8":@{
                                                @"right":@[@{@"key":@"sendBtn"}],
                                                },
                                        @"navbar-type9":@{
                                                @"left":@[@{@"key":@"cancelBtn"}],
                                                @"right":@[@{@"key":@"sendBtn"}],
                                                },
                                        @"navbar-type10":@{
                                                @"right":@[@{@"key":@"saveBtn"}],
                                                },
                                        };
    return navigationBarData;
}


@end
