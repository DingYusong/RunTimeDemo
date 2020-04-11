//
//  DYSDemo01ViewController.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2020/4/9.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSDemo01ViewController.h"
#import "DYSDog.h"
#import <objc/runtime.h>
#import "DYSDog2.h"
#import "DYSAssistObject.h"


@interface DYSDemo01ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataSourceArray;

@end

@implementation DYSDemo01ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//    [DYSDog specie];
//    [[DYSDog new] learnRunning];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"LayerExplore";
    self.dataSourceArray = @[
        @{
            @"title": @"Working with Instances/实例使用",
            @"array": @[
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_dispose",
                    },
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_copy",
                    },
                    @{
                        @"title": @"object_copy",
                    }
                    
            ]
        },
        @{
            @"title": @"Obtaining Class Definitions/获得类定义",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                    }
            ]
        },
        @{
            @"title": @"Working with Classes",
            @"array": @[
                    @{
                        @"title": @"class_copyIvarList",
                    },
                    @{
                        @"title": @"class_copyPropertyList",
                    },
                    @{
                        @"title": @"class_copyMethodList",
                    },
                    @{
                        @"title": @"class_copyProtocolList",
                    }
                    
            ]
        },
        @{
            @"title": @"Instantiating Classes",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Adding Classes",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Working with Methods",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Working with Instance Variables",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Working with Properties",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Working with Protocols",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Working with Libraries",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Working with Selectors",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Objective-C Language Features",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title": @"Associative References",
            @"array": @[
                    @{
                        @"title": @"message API熟悉",
                        @"page": @"DYSDemo02ViewController"
                    }
            ]
        },
    ];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *item = self.dataSourceArray[section];
    NSArray *sectionArray = [item objectForKey:@"array"];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    NSDictionary *item = self.dataSourceArray[indexPath.section];
    NSArray *sectionArray = [item objectForKey:@"array"];
    NSDictionary *dict = [sectionArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"title"];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *item = self.dataSourceArray[section];
    return [item objectForKey:@"title"];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = self.dataSourceArray[indexPath.section];
    NSArray *sectionArray = [item objectForKey:@"array"];
    NSDictionary *dict = [sectionArray objectAtIndex:indexPath.row];
    NSString *title = [dict objectForKey:@"title"];
    
    
    if ([title isEqualToString:@"title"]) {
        
    }
    
    
    switch (indexPath.section) {
        case 0: {
            //Working with Instances
            switch (indexPath.row) {
                case 0:
                {
                    //object_copy
                    [[DYSDog2 new] dys_object_copy];
                }
                    break;
                case 1:
                {
                    //object_copy
                    [[DYSDog2 new] dys_object_dispose];
                }
                    break;
                default:
                    break;
            }
        } break;
        case 2: {
            DYSAssistObject *assistObject = [DYSAssistObject new];
            [assistObject performSelector:NSSelectorFromString([NSString stringWithFormat:@"dys_%@",title])];
        } break;
        default:
            break;
    }
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
