//
//  DYSAssistObject.h
//  RunTimeDemo
//
//  Created by 丁玉松 on 2020/4/11.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYSAssistObject : NSObject

//-- Working with Classes

- (void)dys_class_copyIvarList;
- (void)dys_class_copyPropertyList;
- (void)dys_class_copyMethodList;
- (void)dys_class_copyProtocolList;
@end


NS_ASSUME_NONNULL_END
