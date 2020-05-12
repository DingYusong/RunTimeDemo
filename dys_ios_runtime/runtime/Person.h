//
//  Person.h
//  RunTimeTest
//
//  Created by 丁玉松 on 16/4/20.
//  Copyright © 2016年 Beijing Yingyan Internet Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PersonDelegate <NSObject>

-(void)presonDelegateWork;

@end


@interface Person : NSObject
{

    NSString *_hand;
}

@property (nonatomic ,assign) id <PersonDelegate> delegate;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *sex;

@property (nonatomic ,assign) int age;
@property (nonatomic ,assign) float height;

@property (nonatomic ,copy) NSString *job;
@property (nonatomic ,copy) NSString *native;
@property (nonatomic ,copy) NSString *eduction;




-(void)eat;


-(void)sleep;


-(void)work;


@end
