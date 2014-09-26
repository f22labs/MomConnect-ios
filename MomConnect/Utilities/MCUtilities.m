//
//  MCUtilities.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCUtilities.h"
#import "MCAppConstants.h"

@implementation MCUtilities

#pragma mark - Fonts

+ (UIFont *)dinSystemAlternateBoldFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"DINAlternate-Bold" size:fontSize];
}

+ (UIFont *)dinAlternateMediumFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"DINMediumAlternate" size:fontSize];
}

+ (UIFont *)interstateRegularFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Interstate-Regular" size:fontSize];
}

#pragma mark -

+ (UIFont *)navBarTitleFont {
    return [MCUtilities dinSystemAlternateBoldFontWithSize:17.0];
}

+ (UIColor *)navBarTitleTextColor {
    return [UIColor blackColor];
}

+ (UIColor *)navBarTintColor {
    return UIColorFromRGB(0xe9ebec);
}

#pragma mark -

+ (BOOL)checkNullValue:(id)object {
    
    return [object isEqual:[NSNull null]] || [[NSString stringWithFormat:@"%@", object] isEqualToString:@"<null>"] || object == nil || [[NSString stringWithFormat:@"%@", object] isEqualToString:@"(null)"];
}

+ (BOOL)checkEmptyStringValue:(id)object {
    
    return [self checkNullValue:object] || [[NSString stringWithFormat:@"%@",object] isEqualToString:@""];
}


#pragma mark -


+ (BOOL)isUserLoggedIn {
    
    BOOL loggedin = NO;
    
    //Check if there is a valid auth token saved
    
    return loggedin;
}

+ (instancetype)getLoggedInUser {
    
    //Retreive the user details from the User Defaults
    
    return nil;
}

+ (BOOL)saveLoggedInUser:(id)user {
    
    BOOL saved = NO;
    
    //Save the details in the User Defaults
    
    return saved;
}

@end
