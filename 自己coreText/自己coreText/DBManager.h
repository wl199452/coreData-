//
//  DBManager.h
//  自己coreText
//
//  Created by 王林 on 2017/10/28.
//  Copyright © 2017年 edon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person+CoreDataClass.h"
#import <CoreData/CoreData.h>

@interface DBManager : NSObject

//  创建数据库
+ (BOOL)createSqlite;

//add
+ (BOOL)addObjc;

//delete
+(BOOL)deleteObjc;

//seach
+(NSMutableArray *)searchObjcS;

//update
+(BOOL)updateObjc;


@end
