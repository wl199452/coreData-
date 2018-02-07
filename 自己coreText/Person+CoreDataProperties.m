//
//  Person+CoreDataProperties.m
//  自己coreText
//
//  Created by 王林 on 2017/10/28.
//  Copyright © 2017年 edon. All rights reserved.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic age;
@dynamic name;
@dynamic waihao;

@end
