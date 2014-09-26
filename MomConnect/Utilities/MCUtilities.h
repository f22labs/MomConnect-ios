//
//  MCUtilities.h
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface MCUtilities : NSObject

+ (UIFont *)dinSystemAlternateBoldFontWithSize:(CGFloat)fontSize;
+ (UIFont *)dinAlternateMediumFontWithSize:(CGFloat)fontSize;
+ (UIFont *)interstateRegularFontWithSize:(CGFloat)fontSize;


+ (BOOL)isUserLoggedIn;

+ (instancetype)getLoggedInUser;
+ (BOOL)saveLoggedInUser:(id)user;
@end
