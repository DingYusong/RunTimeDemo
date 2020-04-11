//
//  DYSCodingViewController.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2020/4/11.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSCodingViewController.h"
#import "Person.h"

@interface DYSCodingViewController ()

@end

@implementation DYSCodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *person = [[Person alloc]init];
    person.name = @"丁先生";
    person.sex = @"男";
    person.age = 29;
    person.height = 175;
    
    NSString *path = [NSString stringWithFormat:@"%@/archive",NSHomeDirectory()];
    
    [NSKeyedArchiver archiveRootObject:person toFile:path];

    Person *unarchivePerson = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"\noriginPerson == %@;\nunarchivePerson == %@",person,unarchivePerson);
    /*
     originPerson == <Person: 0x60400009c520>;
     unarchivePerson == <Person: 0x60400009c700>
     */
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
