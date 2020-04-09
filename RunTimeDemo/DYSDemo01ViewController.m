//
//  DYSDemo01ViewController.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2020/4/9.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSDemo01ViewController.h"
#import "DYSDog.h"

@interface DYSDemo01ViewController ()

@end

@implementation DYSDemo01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [DYSDog specie];
    [[DYSDog new] learnRunning];
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
