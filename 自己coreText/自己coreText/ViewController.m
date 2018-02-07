//
//  ViewController.m
//  自己coreText
//
//  Created by 王林 on 2017/10/28.
//  Copyright © 2017年 edon. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"

@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

   BOOL issuccess = [DBManager createSqlite];

    if (issuccess) {
        NSLog(@"数据库初次加载成功");
    }
}
- (IBAction)add:(UIButton *)sender {
    [DBManager addObjc];
}

- (IBAction)delete:(UIButton *)sender {

    [DBManager deleteObjc];
}
- (IBAction)search:(UIButton *)sender {
    [DBManager searchObjcS];
}

- (IBAction)update:(UIButton *)sender {
    [DBManager updateObjc];
}




@end
