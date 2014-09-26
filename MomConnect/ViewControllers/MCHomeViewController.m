//
//  MCHomeViewController.m
//  MomConnect
//
//  Created by Chandu on 26/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCHomeViewController.h"
#import "MCHomeViewLayout.h"

@interface MCHomeViewController ()

@end

@implementation MCHomeViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    
    self = [super initWithCollectionViewLayout:[MCHomeViewLayout getHomeViewLayout]];
    
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.title = @"Mom Connect";
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    switch (indexPath.row) {
        case 0:
            cell.backgroundColor = [UIColor cyanColor];
            break;
        
        case 1:
            cell.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            cell.backgroundColor = [UIColor blueColor];
            break;
        default:
            cell.backgroundColor = [UIColor yellowColor];
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
    
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}
@end
