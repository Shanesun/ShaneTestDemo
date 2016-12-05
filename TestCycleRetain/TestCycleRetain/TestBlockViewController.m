//
//  TestBlockViewController.m
//  TestCycleRetain
//
//  Created by Shane on 16/7/26.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "TestBlockViewController.h"

typedef void(^testblock)();

@interface TestBlockViewController ()

@property (strong, nonatomic) testblock testBlock;
@property (strong, nonatomic) NSString *testString;

@end

@implementation TestBlockViewController

- (void)dealloc{
    NSLog(@"========dealloc========");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testString = @"before block";
    NSLog(@"----before block----");
    
    __weak typeof(self) weakSelf = self;
    self.testBlock = ^{
         __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf blockAction];
        
    };
    
    self.testBlock();
}

- (void)blockAction
{
    self.testString = @"after block";
    
    NSLog(@"----after block----");
    __strong typeof(self) tempSelf = self;
    NSLog(@"%@",tempSelf);
}

@end
