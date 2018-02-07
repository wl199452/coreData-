//
//  DBManager.m
//  自己coreText
//
//  Created by 王林 on 2017/10/28.
//  Copyright © 2017年 edon. All rights reserved.
//

#import "DBManager.h"



@implementation DBManager

static NSManagedObjectContext * _context;
static NSMutableArray * _dataSource;


//创建数据库
+ (BOOL)createSqlite{

    BOOL creatYes;

    //1、创建模型对象
    //获取模型路径
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"__coreText" withExtension:@"momd"];
    //根据模型文件创建模型对象
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];

    //2、创建持久化存储助理：数据库
    //利用模型对象创建助理对象
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];

    //数据库的名称和路径
    NSString *docStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *sqlPath = [docStr stringByAppendingPathComponent:@"coreData.sqlite"];
    NSURL *sqlUrl = [NSURL fileURLWithPath:sqlPath];

    NSError *error = nil;
    //设置数据库相关信息 添加一个持久化存储库并设置类型和路径，NSSQLiteStoreType：SQLite作为存储库
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlUrl options:nil error:&error];

    if (error) {
        NSLog(@"添加数据库失败:%@",error);
        creatYes = NO;
    } else {
        NSLog(@"添加数据库成功");
        creatYes = YES;
    }
    //3、创建上下文 保存信息 操作数据库
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    //关联持久化助理
    context.persistentStoreCoordinator = store;
    _context = context;
    return creatYes;

};

+(BOOL)addObjc{
    NSLog(@"-------------------------------");
    Person *per = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:_context];
    per.name = @"mumu";
    per.age = 18;
    per.waihao = @"dasd";
    //保存,用 save 方法
    NSError *error = nil;

    BOOL success = [_context save:&error];
    if (success) {
        NSLog(@"插入数据成功");
    }else{
        NSLog(@"插入数据失败");
    }
    return success;
}


+(BOOL)deleteObjc{
NSLog(@"-------------------------------");
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];

    NSPredicate *predic = [NSPredicate predicateWithFormat:@"name = %@",@"mumu"];
    request.predicate = predic;

    //查询数据
    NSArray *objs = [_context executeFetchRequest:request error:nil];

    for (Person *p in objs) {
        NSLog(@"删除的数据是-------%@",p.name);
        [_context deleteObject:p];
    }

    NSError *error;
    BOOL success = [_context save:&error];
    if (success) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
    return success;
}

+(NSArray *)searchObjcS{
    NSLog(@"-------------------------------");
    NSArray *objcS = [[NSArray alloc]init];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name = %@",@"mumu"];
    request.predicate = pre;

    NSArray *objs = [_context executeFetchRequest:request error:nil];
    NSError *error;
    BOOL success = [_context save:&error];
    if (success) {
        NSLog(@"查找成功");

        for (Person *p in objs) {
            NSLog(@"找出的数据是-------%@,%@",p.name,p.waihao);
        }

        return objs;
    }else{
        NSLog(@"查找失败");
        return objcS;
    }

}

+(BOOL)updateObjc{
NSLog(@"-------------------------------");
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name = %@",@"mumu"];
    request.predicate = pre;

    NSArray *objs = [_context executeFetchRequest:request error:nil];

    for (Person *p in objs) {
        p.age = 22;
        p.name = @"Top";
        NSLog(@"更新后的------name = %@ ,age = %lld",p.name,p.age);
    }

    NSError *error;
    BOOL success = [_context save:&error];
    if (success) {
        NSLog(@"更新成功");
    }else{
        NSLog(@"更新失败");
    }
    return success;
}


















@end
