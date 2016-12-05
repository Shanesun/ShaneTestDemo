//
//  ViewController.m
//  TestYYCache
//
//  Created by Shane on 16/7/28.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // 创建队列组
    dispatch_group_t group = dispatch_group_create();
    // 创建信号量，并且设置值为10
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 100; i++)
    {
        NSLog(@"==%d",i);
        // 由于是异步执行的，所以每次循环Block里面的dispatch_semaphore_signal根本还没有执行就会执行dispatch_semaphore_wait，从而semaphore-1.当循环10此后，semaphore等于0，则会阻塞线程，直到执行了Block的dispatch_semaphore_signal 才会继续执行
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(group, queue, ^{
            NSLog(@"block in: %i",i);
            sleep(2);
            // 每次发送信号则semaphore会+1，
//            dispatch_semaphore_signal(semaphore);
        });
    }
    
    NSLog(@"------finish------");
    
    
//    // 死锁
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"-------dispatch_get_main_queue gogogogo -----");
//    });
//    
//     NSLog(@"------ finish -----");
    
}
- (IBAction)buttonClicked:(id)sender {
        NSLog(@"------clicked------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
