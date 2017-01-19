//
//  main.m
//  TestMemory
//
//  Created by Shane on 2016/12/9.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSError *error = [NSError new];
        error = nil;
        
        NSString *hello1 = @"hello";
        NSString *hello2 = @"hello";
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
