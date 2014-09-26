//
//  MCHomeViewLayout.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCHomeViewLayout.h"
#import "MCAppConstants.h"
#import "MCUtilities.h"

@implementation MCHomeViewLayout

+ (MCHomeViewLayout *)getHomeViewLayout {
    
    MCHomeViewLayout *homeViewLayout = [[MCHomeViewLayout alloc] init];
    homeViewLayout.minimumLineSpacing = 20.0;
    homeViewLayout.minimumInteritemSpacing = 20.0;
    homeViewLayout.itemSize = CGSizeMake(HOME_CELL_ITEM_SIZE, HOME_CELL_ITEM_SIZE);
    homeViewLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    return homeViewLayout;
}

@end
