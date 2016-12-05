//
//  Entity+CoreDataProperties.h
//  TestCoreData
//
//  Created by Shane on 2016/11/9.
//  Copyright © 2016年 Shane. All rights reserved.
//

#import "Entity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Entity (CoreDataProperties)

+ (NSFetchRequest<Entity *> *)fetchRequest;

@property (nonatomic) int16_t att1;
@property (nullable, nonatomic, copy) NSString *att2;

@end

NS_ASSUME_NONNULL_END
