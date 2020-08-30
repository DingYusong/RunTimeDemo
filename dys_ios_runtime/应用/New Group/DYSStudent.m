//
//  DYSStudent.m
//  dys_ios_runtime
//
//  Created by DingYusong on 2020/8/30.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSStudent.h"
#import <objc/runtime.h>

@implementation DYSStudent
+ (Class)getClassTypeOfProperty:(NSString *)propertyName {
    objc_property_t property = class_getProperty([self class], propertyName.UTF8String);
    if (property) {
//        NSString *attributes = [NSString stringWithUTF8String:property_getAttributes(property)];
//        NSString *value = [NSString stringWithUTF8String:property_copyAttributeValue(property, @"T".UTF8String)];
//
//        NSLog(@"attributes:%@",attributes);
//        NSLog(@"value:%@",value);
//
////        NSArray *array = [NSClassFromString(value) new];
////        NSLog(@"array.count:%tu",array.count);
//
//        NSArray *array = [objc_getClass(property_copyAttributeValue(property, "T")) new];
//        NSLog(@"array.count:%tu",array.count);
        
        
        
        
        
//        return objc_getClass(property_copyAttributeValue(property, "T"));
        
        
        NSString *className = [NSString stringWithUTF8String:property_copyAttributeValue(property, @"T".UTF8String)];
        return NSClassFromString(className);
//        return objc_getClass([NSString stringWithUTF8String:property_copyAttributeValue(property, "T")].UTF8String);

    }
    
    
    return Nil;
}
@end
