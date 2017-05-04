//
//  ViewController.m
//  TestThread
//
//  Created by Shane on 2017/2/14.
//  Copyright © 2017年 Shane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) NSString *str;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self executeLock];
}

- (void)executeLock {
    NSCondition* lock = [[NSCondition alloc] init];
    NSLog(@"程序开始");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(5);
        [lock lock];
        [lock broadcast];
        [lock unlock];
    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        [self threadMethod:lock];
    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        [self threadMethod:lock];
    });
    
}

-(void)threadMethod:(NSCondition*)lock{
    [lock lock];
    NSLog(@"等待大哥叫我");
    [lock wait];
    NSLog(@"大哥叫我做需求了");
    sleep(2);
    [lock unlock];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
