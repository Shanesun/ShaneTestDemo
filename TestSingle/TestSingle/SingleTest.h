//
//  SingleTest.h
//  TestSingle
//
//  Created by Shane on 2016/11/24.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleTest : NSObject

+ (instancetype)defaultShared;

- (NSMutableArray *)fetchTestArray;

@end
