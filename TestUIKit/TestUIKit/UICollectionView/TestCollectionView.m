//
//  TestCollectionView.m
//  TestUIKit
//
//  Created by Shane on 2017/4/18.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "TestCollectionView.h"
#import "Masonry.h"

@interface TestCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation TestCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel.contentMode = UIViewContentModeCenter;
        self.titleLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

@end


@interface TestCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation TestCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [self createCollectionView];
    
//    [self.collectionView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 100)];
    
    headerV.backgroundColor = [UIColor orangeColor];
    [self.collectionView addSubview:headerV];
    
    self.collectionView.scrollEnabled = NO;
    self.tableView.scrollEnabled = NO;
    
    self.scrollView.delegate = self;
    
    CGSize contentSize = CGSizeMake(self.view.bounds.size.width, 1530 + 667);
    self.scrollView.contentSize = contentSize;
}

- (UIView *)createCollectionView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    self.collectionView = [[UICollectionView alloc] initWithFrame:headerView.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.bounces = NO;
    [self.collectionView registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [headerView addSubview:self.collectionView];
    
    return headerView;
}

#pragma mark- collcetionview
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 40;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = @(indexPath.row).stringValue;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        if (scrollView.contentOffset.y <= self.collectionView.contentSize.height) {
            NSLog(@"| %f",scrollView.contentOffset.y);
            [self.collectionView setContentOffset:scrollView.contentOffset];
        }
        else{
            NSLog(@"|| %d",scrollView.contentOffset.y);
            CGPoint offset = CGPointMake(0, scrollView.contentOffset.y-self.collectionView.contentSize.height);
            [self.tableView setContentOffset:offset];
        }
    }
    else if (scrollView == self.collectionView) {
       
    }
    else if(scrollView == self.tableView){
        
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIPanGestureRecognizer *tmep = [UIPanGestureRecognizer new];
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"--- BeginDecelerating --- ");
//    self.collectionView.scrollEnabled = NO;
//    self.tableView.scrollEnabled = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"--- scrollViewDidEndDecelerating --- ");
}

#pragma mark- tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UILabel *titleLabel = [UILabel new];
        titleLabel.tag = 101;
        titleLabel.contentMode = UIViewContentModeCenter;
        titleLabel.backgroundColor = [UIColor blueColor];
        [cell.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
    }
    
    UILabel *titleLabel = [cell viewWithTag:101];
    titleLabel.text = @(indexPath.row).stringValue;
    
    return cell;
    
}

@end
