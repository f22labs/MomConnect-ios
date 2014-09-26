//
//  MCHomeViewCell.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCHomeViewCell.h"
#import "MCAppConstants.h"

@interface MCHomeViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MCHomeViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews {
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    self.layer.cornerRadius = 3.0;
    
    self.clipsToBounds = YES;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    
    UIView *selectionBgView = [[UIView alloc] init];
    selectionBgView.backgroundColor = UIColorFromRGB(0x85808a);
    self.selectedBackgroundView = selectionBgView;
}

- (void)setTitle:(NSString *)title {
    
    _title = [title copy];
    
    if (_title) {
        
        [self.titleLabel setText:_title];
    }
    else {
        [self.titleLabel setText:@""];
    }
}

+ (NSString *)reuseIdentifier {
    
    static NSString * const reuseIdentifier = @"MCHomeViewCell.reuseIdentifier";
    return reuseIdentifier;
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    
    [self.titleLabel setText:@""];
}

@end
