//
//  MCHomeViewLayout.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCHomeViewLayout.h"

@implementation MCHomeViewLayout

+ (MCHomeViewLayout *)getHomeViewLayout {
    
    MCHomeViewLayout *homeViewLayout = [[MCHomeViewLayout alloc] init];
    homeViewLayout.minimumLineSpacing = 20.0;
    homeViewLayout.minimumInteritemSpacing = 20.0;
    homeViewLayout.itemSize = CGSizeMake(130.0, 130.0);
    homeViewLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    return homeViewLayout;
}

@end
