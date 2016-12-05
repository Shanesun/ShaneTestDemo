//
//  SingleTest.m
//  TestSingle
//
//  Created by Shane on 2016/11/24.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "SingleTest.h"
#import "TestSingleModel.h"


@interface SingleTest ()

@property (strong, nonatomic) NSMutableArray *testMutableArray;

@end

@implementation SingleTest

+ (instancetype)defaultShared
{
    static SingleTest *single = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[SingleTest alloc] init];
    });
    
    return single;
}

- (NSMutableArray *)testMutableArray
{
    if (!_testMutableArray) {
        
        _testMutableArray = [NSMutableArray new];
        
        TestSingleModel *model = [SingleTest createModel];
        [_testMutableArray addObject:model];
        
    }
    
    return _testMutableArray;
}


- (NSMutableArray *)fetchTestArray
{
    return self.testMutableArray;
}

+ (TestSingleModel *)createModel
{
    TestSingleModel *model = [TestSingleModel new];
    
    model.t1 = @"1";
        model.t1 = @"2";
        model.t1 = @"3";
    
    return model;
}



@end
