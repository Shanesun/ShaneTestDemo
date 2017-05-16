//
//  WKWebViewUseViewController.m
//  TestUIKit
//
//  Created by Shane on 2017/5/12.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "WKWebViewUseViewController.h"
#import "BusRecommendDetailWebContentView.h"
#import "Masonry.h"

@interface WKWebViewUseViewController ()

@end

@implementation WKWebViewUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"testsourcecode.txt" ofType:nil];
    NSString *h5 = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    BusRecommendDetailWebContentView *view = [[BusRecommendDetailWebContentView alloc] initWithWebSourceCode:h5 delegate:self];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [view startRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
