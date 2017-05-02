//
//  TestScrollViewViewController.m
//  TestUIKit
//
//  Created by Shane on 2017/4/11.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "TestScrollViewViewController.h"
#import "Masonry.h"

@interface TestScrollViewViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation TestScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self testAddsubviewsToScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Test autolayout add subviews to scrollview
- (void)testAddsubviewsToScrollView
{
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:blueView];
    
    self.scrollView.contentSize = self.view.bounds.size;
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.top.equalTo(blueView.superview).offset(20);
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.equalTo(blueView.superview);
//        make.trailing.equalTo(blueView.superview).offset(-20);
//        make.bottom.equalTo(blueView.superview).offset(-20);
    }];
}
@end
