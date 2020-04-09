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
                                 @"title":@"对象，类，元类",
                                 @"page":@"DYSDemo01ViewController"
                                 },
                             @{
                                 @"title":@"成员变量，属性，方法，协议",
                                 @"page":@"DYSDemo02ViewController"
                                 },
                            @{
                                @"title":@"消息转发",
                                @"page":@"DYSDemo02ViewController"
                                },
                            ];
    self.tableView.rowHeight = 50;

    
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:(self.dataSourceArray.count - indexPath.row - 1)];
    cell.textLabel.text = [dict objectForKey:@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:(self.dataSourceArray.count - indexPath.row - 1)];
    NSString *classString = [dict objectForKey:@"page"];
    UIViewController *vc = [NSClassFromString(classString) new];
//    NSLog(@"2018-001");
//    vc.view.backgroundColor = [UIColor whiteColor];
//    NSLog(@"2018-002");
    [self.navigationController pushViewController:vc animated:YES];
//    NSLog(@"2018-003");
}


@end
