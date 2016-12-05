//
//  ViewController.m
//  TestSingle
//
//  Created by Shane on 2016/11/24.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "ViewController.h"

#import "TestSingleModel.h"
#import "SingleTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray *te = [[SingleTest defaultShared] fetchTestArray];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
