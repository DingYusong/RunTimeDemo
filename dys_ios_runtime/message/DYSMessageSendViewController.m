//
//  DYSMessageSendViewController.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2020/4/14.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSMessageSendViewController.h"
#import "DYSMessageDog.h"
#import "DYSMessageCat.h"

@interface DYSMessageSendViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *dataSourceArray;

@end

@implementation DYSMessageSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSourceArray = @[
    @"正常对象方法执行",
    @"nil对象方法执行",
    @"消息转发机制-resolveInstanceMethod",
    @"消息转发机制-forwardingTargetForSelector",
    @"消息转发机制-forwardInvocation",
    @"消息转发机制-doesNotRecognizeSelector",
    ];
    
    self.tableView.tableFooterView = [UIView new];
}


#pragma mark -  tableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    NSString *text = [self.dataSourceArray objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            //正常消息
            DYSMessageDog *dog = [DYSMessageDog new];
            [dog dys_run];
        }
            break;
        case 1:
        {
            //给nil发消息
            DYSMessageDog *dog = nil;
            [dog dys_run];
        }
            break;
        case 2:
        {
            //resolveInstanceMethod
            DYSMessageDog *dog = [DYSMessageDog new];
            [dog performSelector:@selector(wagDogTail)];
        }
            break;
        case 3:
        {
            //forwardingTargetForSelector
            DYSMessageDog *dog = [DYSMessageDog new];
            [dog performSelector:@selector(climbTree)];
        }
            break;
        case 4:
        {
            //methodSignatureForSelector forwardInvocation
            DYSMessageDog *dog = [DYSMessageDog new];
            [dog performSelector:@selector(playAlone)];
        }
            break;
        case 5:
        {
            //走到了 doesNotRecognizeSelector
            DYSMessageDog *dog = [DYSMessageDog new];
            [dog performSelector:@selector(playWithPeople)];
        }
            break;
            
        default:
            break;
    }
}


@end
