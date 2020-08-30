//
//  DYSStudent.h
//  dys_ios_runtime
//
//  Created by DingYusong on 2020/8/30.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYSDog.h"
#import "DYSCat.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYSStudent : NSObject

@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,assign) NSInteger age;
@property (nonatomic, strong) DYSDog *dog;
@property (nonatomic, copy) NSMutableArray<DYSCat *> *cats;

+ (Class)getClassTypeOfProperty:(NSString *)propertyName;
@end

NS_ASSUME_NONNULL_END
