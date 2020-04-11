//
//  Person.m
//  RunTimeTest
//
//  Created by 丁玉松 on 16/4/20.
//  Copyright © 2016年 Beijing Yingyan Internet Co., Ltd. All rights reserved.
//

#import "Person.h"

#import <objc/runtime.h>

@interface Person () <NSCoding>

@end

@implementation Person


//-(instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    unsigned int count;
//    //获得所有属性，进行解密
//    objc_property_t *propertys = class_copyPropertyList([self class], &count);
//
//    for (int i = 0; i < count; i++) {
//
//        objc_property_t property = propertys[i];
//
//        const char *name = property_getName(property);
//
//        NSString *key = [NSString stringWithUTF8String:name];
//
//        NSString *propertyValue = [aDecoder decodeObjectForKey:key];
//
//        [self setValue:propertyValue forKey:key];
//    }
//
//    free(propertys);
//
//    return self;
//
//}
//
//
//- (void)encodeWithCoder:(NSCoder *)coder
//{
//    unsigned int count;
//    //获得所有属性，进行解密
//    objc_property_t *propertys = class_copyPropertyList([self class], &count);
//
//    for (int i = 0; i < count; i++) {
//
//        objc_property_t property = propertys[i];
//
//        const char *name = property_getName(property);
//
//        NSString *key = [NSString stringWithUTF8String:name];
//
//        NSString *propertyValue = [self valueForKey:key];
//
//        [coder encodeObject:propertyValue forKey:key];
//
//    }
//    free(propertys);
//}



- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeFloat:self.height forKey:@"height"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.age = [aDecoder decodeIntForKey:@"age"];
        self.height = [aDecoder decodeFloatForKey:@"height"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}




@end
