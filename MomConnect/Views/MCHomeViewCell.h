//
//  MCHomeViewCell.h
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCHomeViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *title;

+ (NSString *)reuseIdentifier;

@end
