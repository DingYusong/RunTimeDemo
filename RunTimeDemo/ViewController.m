//
//  ViewController.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2019/4/7.
//  Copyright © 2019 丁玉松. All rights reserved.
//

#import "ViewController.h"
#import "DYSDog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [DYSDog specie];
    
    [[DYSDog new] learnRunning];
}


@end
