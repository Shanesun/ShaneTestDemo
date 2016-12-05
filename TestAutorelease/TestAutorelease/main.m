//
//  main.m
//  TestAutorelease
//
//  Created by Shane on 2016/10/18.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

extern void _objc_autoreleasePoolPrint();
extern int _objc_rootRetainCount();

int main(int argc, char * argv[]) {
    


        _objc_autoreleasePoolPrint();
        id  obj = [[NSObject alloc]init];
        _objc_autoreleasePoolPrint();
        id __weak o = obj;
//                    NSLog(@"count: %d",_objc_rootRetainCount(obj));
//                NSLog(@"class=%@",[o class]);
        //        NSLog(@"count: %d",_objc_rootRetainCount(obj));
        _objc_autoreleasePoolPrint();
    
    @autoreleasepool {
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

