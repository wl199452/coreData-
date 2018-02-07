//
//  Person+CoreDataProperties.h
//  自己coreText
//
//  Created by 王林 on 2017/10/28.
//  Copyright © 2017年 edon. All rights reserved.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nonatomic) int64_t age;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *waihao;

@end

NS_ASSUME_NONNULL_END
