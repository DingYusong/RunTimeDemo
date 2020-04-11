//
//  DYSAssistObject.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2020/4/11.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSAssistObject.h"
#import "Person.h"
#import <objc/runtime.h>

@implementation DYSAssistObject

- (void)dys_class_copyIvarList{
    unsigned int count;
    
    Ivar *ivars = class_copyIvarList([Person class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        
        NSLog(@"%d == %@",i,key);
    }
    
    free(ivars);

    /*
     2020-04-11 17:18:11.133782+0800 RunTimeDemo[10372:125630] 0 == _hand
     2020-04-11 17:18:11.134160+0800 RunTimeDemo[10372:125630] 1 == _age
     2020-04-11 17:18:11.134425+0800 RunTimeDemo[10372:125630] 2 == _height
     2020-04-11 17:18:11.134595+0800 RunTimeDemo[10372:125630] 3 == _delegate
     2020-04-11 17:18:11.134999+0800 RunTimeDemo[10372:125630] 4 == _name
     2020-04-11 17:18:11.135326+0800 RunTimeDemo[10372:125630] 5 == _sex
     2020-04-11 17:18:11.135457+0800 RunTimeDemo[10372:125630] 6 == _job
     2020-04-11 17:18:11.135586+0800 RunTimeDemo[10372:125630] 7 == _native
     2020-04-11 17:18:11.135747+0800 RunTimeDemo[10372:125630] 8 == _eduction
     */
    
}

- (void)dys_class_copyPropertyList {
    unsigned int count;
    
    objc_property_t *propertys = class_copyPropertyList([Person class], &count);
    
    for (int i = 0 ; i < count; i++) {
        objc_property_t property = propertys[i];
        
        const char *name = property_getName(property);
        
        NSString *key = [NSString stringWithUTF8String:name];
        
        NSLog(@"%d == %@",i,key);
        
    }
    
    free(propertys);
    
    /*
     2020-04-11 17:22:32.999547+0800 RunTimeDemo[10443:128282] 0 == delegate
     2020-04-11 17:22:32.999959+0800 RunTimeDemo[10443:128282] 1 == name
     2020-04-11 17:22:33.000426+0800 RunTimeDemo[10443:128282] 2 == sex
     2020-04-11 17:22:33.001102+0800 RunTimeDemo[10443:128282] 3 == age
     2020-04-11 17:22:33.003355+0800 RunTimeDemo[10443:128282] 4 == height
     2020-04-11 17:22:33.003695+0800 RunTimeDemo[10443:128282] 5 == job
     2020-04-11 17:22:33.003789+0800 RunTimeDemo[10443:128282] 6 == native
     2020-04-11 17:22:33.003880+0800 RunTimeDemo[10443:128282] 7 == eduction

     */
}

- (void)dys_class_copyMethodList {
    unsigned int count;
    
    
    Method *methods = class_copyMethodList([Person class], &count);
    
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        
        SEL methodSEL = method_getName(method);
        
        const char *name = sel_getName(methodSEL);
        
        NSString *methodName = [NSString stringWithUTF8String:name];

        int arguments = method_getNumberOfArguments(method);
        
        NSLog(@"%d == %@ %d",i,methodName,arguments);
        
    }
    
    free(methods);
    
    /*
     2020-04-11 17:25:03.644998+0800 RunTimeDemo[10503:129813] 0 == sex 2
     2020-04-11 17:25:03.645391+0800 RunTimeDemo[10503:129813] 1 == setSex: 3
     2020-04-11 17:25:03.645647+0800 RunTimeDemo[10503:129813] 2 == job 2
     2020-04-11 17:25:03.645813+0800 RunTimeDemo[10503:129813] 3 == setJob: 3
     2020-04-11 17:25:03.646093+0800 RunTimeDemo[10503:129813] 4 == native 2
     2020-04-11 17:25:03.646231+0800 RunTimeDemo[10503:129813] 5 == setNative: 3
     2020-04-11 17:25:03.646335+0800 RunTimeDemo[10503:129813] 6 == eduction 2
     2020-04-11 17:25:03.646435+0800 RunTimeDemo[10503:129813] 7 == setEduction: 3
     2020-04-11 17:25:03.646535+0800 RunTimeDemo[10503:129813] 8 == .cxx_destruct 2
     2020-04-11 17:25:03.646783+0800 RunTimeDemo[10503:129813] 9 == name 2
     2020-04-11 17:25:03.646980+0800 RunTimeDemo[10503:129813] 10 == setDelegate: 3
     2020-04-11 17:25:03.647375+0800 RunTimeDemo[10503:129813] 11 == encodeWithCoder: 3
     2020-04-11 17:25:03.647536+0800 RunTimeDemo[10503:129813] 12 == initWithCoder: 3
     2020-04-11 17:25:03.647775+0800 RunTimeDemo[10503:129813] 13 == setName: 3
     2020-04-11 17:25:03.647920+0800 RunTimeDemo[10503:129813] 14 == delegate 2
     2020-04-11 17:25:03.648393+0800 RunTimeDemo[10503:129813] 15 == height 2
     2020-04-11 17:25:03.648712+0800 RunTimeDemo[10503:129813] 16 == setHeight: 3
     2020-04-11 17:25:03.653719+0800 RunTimeDemo[10503:129813] 17 == setAge: 3
     2020-04-11 17:25:03.653846+0800 RunTimeDemo[10503:129813] 18 == age 2
     */
}

- (void)dys_class_copyProtocolList {
    
    unsigned int count;
    
    __unsafe_unretained Protocol **protocols = class_copyProtocolList([Person class], &count);
    
    
    for (int i = 0; i < count; i++) {
        Protocol *protocol = protocols[i];
        
//        const char *name = protocol_getName(protocol);
//        NSString *protocolName = [NSString stringWithUTF8String:name];
//        NSLog(@"%d == %@",i,protocolName);
  
        NSLog(@"%d == %@", i,NSStringFromProtocol(protocol)); // 5
    }
    
    free(protocols);

    /*
     2020-04-11 17:35:56.019833+0800 RunTimeDemo[10722:136349] 0 == NSCoding
     */
    
}


@end
