//
//  MCUtilities.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCUtilities.h"

@implementation MCUtilities

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
