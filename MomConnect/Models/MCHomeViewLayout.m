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

+ (MCHomeViewLayout *)getHomeViewLayoutWithWidth:(CGFloat)width {
    
    MCHomeViewLayout *homeViewLayout = [[MCHomeViewLayout alloc] init];
    homeViewLayout.minimumLineSpacing = HOME_CELL_SPACING;
    homeViewLayout.minimumInteritemSpacing = HOME_CELL_SPACING;
    CGFloat itemWidth = floor((width - 3*HOME_CELL_SPACING)/2);
    homeViewLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
    homeViewLayout.sectionInset = UIEdgeInsetsMake(HOME_CELL_SPACING, HOME_CELL_SPACING, HOME_CELL_SPACING, HOME_CELL_SPACING);
    return homeViewLayout;
}

@end
