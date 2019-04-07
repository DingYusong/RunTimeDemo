//
//  DYSDog.m
//  AspectsDemo
//
//  Created by 丁玉松 on 2019/3/11.
//  Copyright © 2019 PSPDFKit GmbH. All rights reserved.
//

#import "DYSDog.h"
#import <objc/runtime.h>

@implementation DYSDog

+ (void)specie {
    NSLog(@"animal");
    
    
    NSLog(@"%@",self);
    NSLog(@"%@",[self class]);
    NSLog(@"%@",object_getClass(self));
    NSLog(@"%@",class_getSuperclass(self));
    
    NSLog(@"------object_getClass------");
    NSLog(@"%@",object_getClass(self));
    NSLog(@"%@",object_getClass([self class]));//2. [self class] 只是获得当前对象的类，和 object_getClass 不同。object_getClass 或得的是isa指针，可能是类，也可能是元类。
    NSLog(@"%@",object_getClass(object_getClass(self)));
    NSLog(@"%@",object_getClass(object_getClass(object_getClass(self)))); //3. NSObject 的isa指针（object_getClass） 指向自己
    NSLog(@"%@",object_getClass(object_getClass(object_getClass(object_getClass(self)))));
    
    NSLog(@"------class_getSuperclass------");// 3. NSObject 的superclass 是nil
    NSLog(@"%@",class_getSuperclass(self));
    NSLog(@"%@",class_getSuperclass(class_getSuperclass(self)));
    NSLog(@"%@",class_getSuperclass(class_getSuperclass(class_getSuperclass(self))));
    NSLog(@"%@",class_getSuperclass(class_getSuperclass(class_getSuperclass(class_getSuperclass(self)))));
    
    NSLog(@"------object_isClass------");
    NSLog(@"%d",object_isClass(self));
    NSLog(@"%d",object_isClass([self class]));
    NSLog(@"%d",object_isClass(object_getClass(self)));//1. 元类也是类 所以 object_isClass 都为true。反之类不是元类
    NSLog(@"%d",object_isClass(class_getSuperclass(self)));
    
    NSLog(@"------class_isMetaClass------");
    NSLog(@"%d",class_isMetaClass(self));
    NSLog(@"%d",class_isMetaClass([self class]));
    NSLog(@"%d",class_isMetaClass(object_getClass(self)));
    NSLog(@"%d",class_isMetaClass(class_getSuperclass(self)));
    
    /*
     注：object_getClass 获取的是isa指针，实例对象指的是类对象。 类对象指的是元类对象。
     class_getSuperclass 获取的是superclass指针, 示例对象灭有superclass，类对象和元类对象都有。
     */
    /**
     2019-04-07 15:25:39.927355+0800 RunTimeDemo[82841:6021365] animal
     2019-04-07 15:25:39.927516+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.927632+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.927734+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.927838+0800 RunTimeDemo[82841:6021365] NSObject
     2019-04-07 15:25:39.927921+0800 RunTimeDemo[82841:6021365] ------object_getClass------
     2019-04-07 15:25:39.928000+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.928079+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.928167+0800 RunTimeDemo[82841:6021365] NSObject
     2019-04-07 15:25:39.928306+0800 RunTimeDemo[82841:6021365] NSObject
     2019-04-07 15:25:39.928551+0800 RunTimeDemo[82841:6021365] NSObject
     2019-04-07 15:25:39.928782+0800 RunTimeDemo[82841:6021365] ------class_getSuperclass------
     2019-04-07 15:25:39.929000+0800 RunTimeDemo[82841:6021365] NSObject
     2019-04-07 15:25:39.929219+0800 RunTimeDemo[82841:6021365] (null)
     2019-04-07 15:25:39.929455+0800 RunTimeDemo[82841:6021365] (null)
     2019-04-07 15:25:39.929711+0800 RunTimeDemo[82841:6021365] (null)
     2019-04-07 15:25:39.929913+0800 RunTimeDemo[82841:6021365] ------object_isClass------
     2019-04-07 15:25:39.930128+0800 RunTimeDemo[82841:6021365] 1
     2019-04-07 15:25:39.930322+0800 RunTimeDemo[82841:6021365] 1
     2019-04-07 15:25:39.930529+0800 RunTimeDemo[82841:6021365] 1
     2019-04-07 15:25:39.930705+0800 RunTimeDemo[82841:6021365] 1
     2019-04-07 15:25:39.930886+0800 RunTimeDemo[82841:6021365] ------class_isMetaClass------
     2019-04-07 15:25:39.962165+0800 RunTimeDemo[82841:6021365] 0
     2019-04-07 15:25:39.962284+0800 RunTimeDemo[82841:6021365] 0
     2019-04-07 15:25:39.962363+0800 RunTimeDemo[82841:6021365] 1
     2019-04-07 15:25:39.962436+0800 RunTimeDemo[82841:6021365] 0
     2019-04-07 15:25:39.962506+0800 RunTimeDemo[82841:6021365] -----
     */
    
    
    NSLog(@"-----");

    
}

- (void)learnRunning {
    NSLog(@"练习跑步");
    
    NSLog(@"%@",self);
    NSLog(@"%@",[self class]);
    NSLog(@"%@",object_getClass(self));
    NSLog(@"%@",class_getSuperclass(self));
    
    NSLog(@"------object_getClass------");// 4. 一个类在内存中有3种形态以 DYSDog为例。DYSDog的实例，DYSDog的类，DYSDog的元类。
    NSLog(@"%@",object_getClass(self));
    NSLog(@"%@",object_getClass(object_getClass(self)));
    NSLog(@"%@",object_getClass(object_getClass(object_getClass(self))));
    NSLog(@"%@",object_getClass(object_getClass(object_getClass(object_getClass(self)))));
    
    NSLog(@"------class_getSuperclass------");
    NSLog(@"%@",class_getSuperclass(self));
    NSLog(@"%@",class_getSuperclass(class_getSuperclass(self)));
    NSLog(@"%@",class_getSuperclass(class_getSuperclass(class_getSuperclass(self))));
    NSLog(@"%@",class_getSuperclass(class_getSuperclass(class_getSuperclass(class_getSuperclass(self)))));
    
    NSLog(@"------object_isClass------");
    NSLog(@"%d",object_isClass(self));
    NSLog(@"%d",object_isClass([self class]));
    NSLog(@"%d",object_isClass(object_getClass(self)));
    NSLog(@"%d",object_isClass(class_getSuperclass(self)));
    
    NSLog(@"------class_isMetaClass------");
    //    NSLog(@"%d",class_isMetaClass(self)); crash
    NSLog(@"%d",class_isMetaClass([self class]));
    NSLog(@"%d",class_isMetaClass(object_getClass(self)));
    NSLog(@"%d",class_isMetaClass(object_getClass(object_getClass(self))));
    NSLog(@"%d",class_isMetaClass(class_getSuperclass(self)));
    /*
     2019-04-07 15:25:39.962608+0800 RunTimeDemo[82841:6021365] 练习跑步
     2019-04-07 15:25:39.962758+0800 RunTimeDemo[82841:6021365] <DYSDog: 0x600001fdacd0>
     2019-04-07 15:25:39.962834+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.963075+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.963296+0800 RunTimeDemo[82841:6021365] (null)
     2019-04-07 15:25:39.963542+0800 RunTimeDemo[82841:6021365] ------object_getClass------
     2019-04-07 15:25:39.963800+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.964077+0800 RunTimeDemo[82841:6021365] DYSDog
     2019-04-07 15:25:39.964361+0800 RunTimeDemo[82841:6021365] NSObject
     2019-04-07 15:25:39.964755+0800 RunTimeDemo[82841:6021365] NSObject
     2019-04-07 15:25:39.965149+0800 RunTimeDemo[82841:6021365] ------class_getSuperclass------
     2019-04-07 15:25:39.965464+0800 RunTimeDemo[82841:6021365] (null)
     2019-04-07 15:25:39.965715+0800 RunTimeDemo[82841:6021365] (null)
     2019-04-07 15:25:39.966113+0800 RunTimeDemo[82841:6021365] (null)
     2019-04-07 15:25:39.966388+0800 RunTimeDemo[82841:6021365] (null)
     2019-04-07 15:25:39.966733+0800 RunTimeDemo[82841:6021365] ------object_isClass------
     2019-04-07 15:25:39.967002+0800 RunTimeDemo[82841:6021365] 0
     2019-04-07 15:25:39.967414+0800 RunTimeDemo[82841:6021365] 1
     2019-04-07 15:25:39.967612+0800 RunTimeDemo[82841:6021365] 1
     2019-04-07 15:25:39.967911+0800 RunTimeDemo[82841:6021365] 0
     2019-04-07 15:25:39.968136+0800 RunTimeDemo[82841:6021365] ------class_isMetaClass------
     2019-04-07 15:25:39.968345+0800 RunTimeDemo[82841:6021365] 0
     2019-04-07 15:25:39.968592+0800 RunTimeDemo[82841:6021365] 0
     2019-04-07 15:25:39.968798+0800 RunTimeDemo[82841:6021365] 1
     2019-04-07 15:25:39.969005+0800 RunTimeDemo[82841:6021365] 0
     */

}

@end
