//
//  MCBackNavigationButtonView.h
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MCBackNavigationButtonView : UIView

- (id)initWithFrame:(CGRect)frame withTarget:(id)target selection:(SEL)selector;

@property (nonatomic, weak) id target;
@property (nonatomic) SEL selector;

@end
