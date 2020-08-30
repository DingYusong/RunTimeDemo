//
//  DYSGetPropertyTypeViewController.m
//  dys_ios_runtime
//
//  Created by DingYusong on 2020/8/30.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSGetPropertyTypeViewController.h"
#import "DYSStudent.h"
#import <objc/runtime.h>

@interface DYSGetPropertyTypeViewController ()

@end

@implementation DYSGetPropertyTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    objc_property_t nameProperty=class_getProperty(objc_getClass("DYSStudent"), "age");
    unsigned  int count=0;
    //2、获取属性列表
    objc_property_attribute_t *attributeList=property_copyAttributeList(nameProperty, &count);
    for (int i=0; i<count; i++) {
        //3、获取属性
        objc_property_attribute_t t= attributeList[i];
        NSLog(@"name=%s value=%s",t.name,t.value);
    }
/*
 2020-08-30 11:03:14.758799+0800 dys_ios_runtime[24123:497560] name=T value=@"NSString"
 2020-08-30 11:03:14.758964+0800 dys_ios_runtime[24123:497560] name=C value=
 2020-08-30 11:03:14.759072+0800 dys_ios_runtime[24123:497560] name=N value=
 2020-08-30 11:03:14.759189+0800 dys_ios_runtime[24123:497560] name=V value=_name
 
 2020-08-30 11:02:23.153667+0800 dys_ios_runtime[24108:496849] name=T value=@"DYSDog"
 2020-08-30 11:02:23.153846+0800 dys_ios_runtime[24108:496849] name=& value=
 2020-08-30 11:02:23.154006+0800 dys_ios_runtime[24108:496849] name=N value=
 2020-08-30 11:02:23.154110+0800 dys_ios_runtime[24108:496849] name=V value=_dog
 
 2020-08-30 11:19:59.007442+0800 dys_ios_runtime[24279:505862] name=T value=@"NSMutableArray"
 2020-08-30 11:19:59.007914+0800 dys_ios_runtime[24279:505862] name=C value=
 2020-08-30 11:19:59.008056+0800 dys_ios_runtime[24279:505862] name=N value=
 2020-08-30 11:19:59.008170+0800 dys_ios_runtime[24279:505862] name=V value=_cats
 */
    
    //    property_copyAttributeValue(, <#const char * _Nonnull attributeName#>)
    NSLog(@"cats:%@",[DYSStudent getClassTypeOfProperty:@"cats"]);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
