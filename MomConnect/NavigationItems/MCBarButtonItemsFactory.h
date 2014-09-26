//
//  MCBarButtonItemsFactory.h
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCNavigationBarManager.h"
@import UIKit;

@interface MCBarButtonItemsFactory : NSObject

@property(nonatomic, weak)MCNavigationBarManager *manager;

- (UIBarButtonItem *)barButtonItemForDictionary:(NSDictionary *)navBarDict forViewController:(UIViewController *)viewController;

@end
