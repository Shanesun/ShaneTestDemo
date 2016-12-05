//
//  Entity+CoreDataProperties.m
//  TestCoreData
//
//  Created by Shane on 2016/11/9.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "Entity+CoreDataProperties.h"

@implementation Entity (CoreDataProperties)

+ (NSFetchRequest<Entity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
}

@dynamic att1;
@dynamic att2;

@end
