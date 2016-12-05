//
//  ViewController.m
//  TestAutorelease
//
//  Created by Shane on 2016/10/18.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "ViewController.h"



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

- (IBAction)testWeakAddAutoreleasePool:(id)sender {
    @autoreleasepool {
  

    }
    }

@end
