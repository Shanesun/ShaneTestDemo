//
//  ViewController.m
//  TestUIKit
//
//  Created by Shane on 2017/4/11.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "ViewController.h"
#import "TestScrollViewViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testScrollView:(UIButton *)sender {

    if (![sender.currentTitle isEqualToString:@"TestScrollView"]) {
        Class cla = NSClassFromString(sender.currentTitle);
        UIViewController *vc = [cla new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        TestScrollViewViewController *testScrollView = [TestScrollViewViewController new];
        [self.navigationController pushViewController:testScrollView animated:YES];
    }
}

@end

