//
//  DYSDog2.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2020/4/11.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSDog2.h"
#import "DYSDog.h"
#import <objc/runtime.h>

/*
 注意：提前添加编译指令  -fno-objc-arc  关闭arc
 */

@implementation DYSDog2

/*
 object_copy
 */

- (void)dys_object_copy {
    
    DYSDog *obj = [DYSDog new];
    NSLog(@"%p", &obj);
    //object_copy 的两个参数：1、已经存在的对象本身  2、需要申请的对象的空间大小
    id objTest = object_copy(obj, sizeof(obj));
    NSLog(@"%p", &objTest);//0x7fff5fbff7c0
    NSLog(@"%@", objTest);//[objTest testFun1];//testFun1
    
    /*
     2020-04-11 16:27:25.855943+0800 RunTimeDemo[9242:92577] 0x7ffee4a00e48
     2020-04-11 16:27:25.856170+0800 RunTimeDemo[9242:92577] 0x7ffee4a00e40
     2020-04-11 16:27:25.856402+0800 RunTimeDemo[9242:92577] <DYSDog: 0x600000008240>
     */
    
    [objTest learnRunning];//可以执行

    
    free(objTest);
}

- (void)dys_object_dispose {
    DYSDog *dog = [DYSDog new];
    NSLog(@"before: %p",dog);// before: 0x600000007460
    NSLog(@"before: %@",dog);//before: <DYSDog: 0x600000007460>
    [dog learnRunning];
    object_dispose(dog);
    NSLog(@"after: %p",dog);//after: 0x600000007460
//    NSLog(@"after: %@",dog);//crash
//    [dog learnRunning];//crash，野指针了
    
}


@end
