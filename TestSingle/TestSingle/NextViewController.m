//
//  NextViewController.m
//  TestSingle
//
//  Created by Shane on 2016/11/24.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "NextViewController.h"
#import "SingleTest.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
        NSMutableArray *te = [[SingleTest defaultShared] fetchTestArray];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
