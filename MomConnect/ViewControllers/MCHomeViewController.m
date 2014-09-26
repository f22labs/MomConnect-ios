//
//  MCHomeViewController.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCHomeViewController.h"
#import "MCHomeViewLayout.h"
#import "MCHomeViewCell.h"
#import "MCTipCreationViewController.h"
#import "MCNavigationBarManager.h"

@interface MCHomeViewController ()

@end

@implementation MCHomeViewController

- (instancetype)init {
    
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[MCNavigationBarManager sharedManager] applyPropertiesForPropertyKey:@"navbar-type1" toViewController:self withTitleView:nil];
    
    self.title = @"Mom Connect";

    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView setCollectionViewLayout:[MCHomeViewLayout getHomeViewLayoutWithWidth:CGRectGetWidth(self.collectionView.frame)]];
    
    // Register cell classes
    [self.collectionView registerClass:[MCHomeViewCell class] forCellWithReuseIdentifier:[MCHomeViewCell reuseIdentifier]];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MCHomeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MCHomeViewCell reuseIdentifier] forIndexPath:indexPath];
    
    // Configure the cell
    
    switch (indexPath.row) {
        case 0:
            cell.title = @"Add a tip";
            break;
        
        case 1:
            cell.title = @"Subscribe a patient";
            break;
        case 2:
            cell.title = @"View tips";
            break;
        default:
            cell.title = @"About Us";
            break;
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            //Add a tip
        {
            MCTipCreationViewController *tipCreationVC = [[MCTipCreationViewController alloc] init];
            [self.navigationController pushViewController:tipCreationVC animated:YES];
        }
            break;
        case 1:
            //Subscribe a patient
            break;
        case 2:
            //View tips
            break;
            
        default:
            //About Us
            break;
    }
}
@end
