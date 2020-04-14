//
//  DYSMessageDog.m
//  objc_msg_send_demo
//
//  Created by 丁玉松 on 2019/12/3.
//  Copyright © 2019 丁玉松. All rights reserved.
//

#import "DYSMessageDog.h"
#import <objc/runtime.h>
#import "DYSMessageCat.h"

@implementation DYSMessageDog

//void wagTail(){
//    NSLog(@"wagTail");
//}

- (void)wagTail {
    NSLog(@"wagTail");
}


/// step 1
/// @param sel sel description
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(wagDogTail)) {
    if ([NSStringFromSelector(sel) isEqualToString:@"wagDogTail"]) {
            
//        class_addMethod(self.class, sel, (IMP)wagTail, "");
        class_addMethod(self.class, sel, class_getMethodImplementation(self, @selector(wagTail)), "");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}




/// step 2
/// @param aSelector aSelector description
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(climbTree)) {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"climbTree"]) {
        return [DYSMessageCat new];
    }
    return [super forwardingTargetForSelector:aSelector];
}



/// step 3
/// @param aSelector aSelector description
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"playAlone"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL selector = [anInvocation selector];
    if (selector == @selector(playAlone)) {
        //调用对象，进行转发
        DYSMessageCat *cat = [DYSMessageCat new];
        [anInvocation invokeWithTarget:cat];
    } else {
        return [super forwardInvocation:anInvocation];
    }
}

/// step 4 - game over
/// @param aSelector aSelector description
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"doesNotRecognizeSelector:%@",NSStringFromSelector(aSelector));
}

@end
