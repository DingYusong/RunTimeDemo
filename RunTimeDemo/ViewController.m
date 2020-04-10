//
//  ViewController.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2019/4/7.
//  Copyright © 2019 丁玉松. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataSourceArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"LayerExplore";
    self.dataSourceArray = @[
        @{
            @"title":@"实例-object/instance",
            @"array":@[
                    @{
                        @"title":@"对象，类，元类",
                        @"page":@"DYSDemo01ViewController"
                    }
            ]
        },
        @{
            @"title":@"类-class",
            @"array":@[
                    @{
                        @"title":@"对象，类，元类",
                        @"page":@"DYSDemo01ViewController"
                    }
            ]
        },
        @{
            @"title":@"元类-metaClass",
            @"array":@[
                    @{
                        @"title":@"对象，类，元类",
                        @"page":@"DYSDemo01ViewController"
                    }
            ]
        },
        @{
            @"title":@"objc/runtime.h",
            @"array":@[
                    @{
                        @"title":@"成员变量，属性，方法，协议",
                        @"page":@"DYSDemo02ViewController"
                    }
            ]
        },
        @{
            @"title":@"objc/message.h",
            @"array":@[
                    @{
                        @"title":@"消息转发",
                        @"page":@"DYSDemo02ViewController"
                    }
            ]
            
        },
    ];
//    self.tableView.rowHeight = 50;
    self.tableView.tableFooterView = [UIView new];
}



#pragma mark - UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
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
    NSString *classString = [dict objectForKey:@"page"];
    UIViewController *vc = [NSClassFromString(classString) new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
