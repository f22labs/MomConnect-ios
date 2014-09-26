//
//  MCNavigationBarManager.h
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface MCNavigationBarManager : NSObject

+ (MCNavigationBarManager *)sharedManager;

- (void)applyPropertiesForPropertyKey:(NSString *)propertyKey toViewController:(UIViewController *)viewController withTitleView:(UIView *)titleView;

@end
