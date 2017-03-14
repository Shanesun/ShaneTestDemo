//
//  TestCollectionViewController.m
//  SSMultimediaDataFlowDemo
//
//  Created by Shane on 2017/3/8.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "TestCollectionViewController.h"

@interface TestCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) UICollectionViewFlowLayout *horiFlowLayout;

@property (assign, nonatomic) CGSize itemSize;

@end

@implementation TestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.horiFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.horiFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.horiFlowLayout.minimumLineSpacing = 0;
    
    self.collectionView.collectionViewLayout = self.flowLayout;
    self.collectionView.pagingEnabled = YES;
    
 
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIView *tmpView= [[UIView alloc] initWithFrame:CGRectMake(0, 400, 60, 60)];
    tmpView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:tmpView];
    
    [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
        tmpView.frame = CGRectMake(30, 500, 120, 120);
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (cell) {
        UILabel *title = [cell viewWithTag:100];
        title.text = @(indexPath.row).stringValue;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    CGRect fullViewRect = [cell.superview convertRect:cell.frame toView:self.collectionView.superview];
    cell.frame = fullViewRect;
    [self.collectionView.superview addSubview:cell];
    
    
     if (self.collectionView.collectionViewLayout == self.flowLayout) {
    
    [UIView animateWithDuration:0.33 animations:^{
        cell.frame = self.collectionView.frame;
    }completion:^(BOOL finished) {
       
            [self.collectionView setCollectionViewLayout:self.horiFlowLayout animated:NO completion:^(BOOL finished) {
                UICollectionViewLayoutAttributes *itemAttribute = [self.horiFlowLayout layoutAttributesForItemAtIndexPath:indexPath];
                CGRect frame = itemAttribute.frame;
                [self.collectionView addSubview:cell];
                cell.frame = frame;
            }];
    }];
     
//            [self.collectionView setCollectionViewLayout:self.flowLayout animated:NO];
     }
     else {
         
     }
    
 [self.collectionView performBatchUpdates:^{


 } completion:^(BOOL finished) {
     
 }];
    
}

#pragma mark- collection layout 
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionViewLayout ==self.flowLayout) {
        return CGSizeMake(100, 100);
    }
    else {
        return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    }
}
@end
