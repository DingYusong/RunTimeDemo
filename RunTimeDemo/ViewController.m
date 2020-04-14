//
//  ViewController.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2019/4/7.
//  Copyright © 2019 丁玉松. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

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
            @"title": @"objc/runtime.h",
            @"page": @"DYSDemo01ViewController"
        },
        @{
            @"title": @"objc/message.h",
            @"page": @"DYSMessageViewController"
        },
        @{
            @"title": @"应用-自动归档（NSCoding）",
            @"page": @"DYSCodingViewController"
        },
        @{
            @"title": @"应用-字典和模型转换（NSDictionary，NSObject）",
            @"page": @"DYSModelShiftViewController"
        },
    ];
    self.tableView.tableFooterView = [UIView new];
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
    NSDictionary *dict = self.dataSourceArray[indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"title"];
    cell.textLabel.font = [UIFont systemFontOfSize:13];

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.dataSourceArray[indexPath.row];
    NSString *classString = [dict objectForKey:@"page"];
    UIViewController *vc = [NSClassFromString(classString) new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
