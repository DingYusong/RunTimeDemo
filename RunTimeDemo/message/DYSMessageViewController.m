//
//  DYSMessageViewController.m
//  RunTimeDemo
//
//  Created by 丁玉松 on 2020/4/11.
//  Copyright © 2020 丁玉松. All rights reserved.
//

#import "DYSMessageViewController.h"
#import <objc/message.h>
#import "DYSCat.h"
#import "DYSMessageSendViewController.h"


@interface DYSMessageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataSourceArray;


@end

@implementation DYSMessageViewController

/*
 其实编译器会根据情况在objc_msgSend, objc_msgSend_stret, objc_msgSendSuper, 或 objc_msgSendSuper_stret四个方法中选择一个来调用。如果消息是传递给超类，那么会调用名字带有”Super”的函数；如果消息返回值是数据结构而不是简单值时，那么会调用名字带有”stret”的函数。排列组合正好四个方法。

 值得一提的是在 i386 平台处理返回类型为浮点数的消息时，需要用到objc_msgSend_fpret函数来进行处理，这是因为返回类型为浮点数的函数对应的 ABI(Application Binary Interface) 与返回整型的函数的 ABI 不兼容。此时objc_msgSend不再适用，于是objc_msgSend_fpret被派上用场，它会对浮点数寄存器做特殊处理。不过在 PPC 或 PPC64 平台是不需要麻烦它的。

 PS：有木有发现这些函数的命名规律哦？带“Super”的是消息传递给超类；“stret”可分为“st”+“ret”两部分，分别代表“struct”和“return”；“fpret”就是“fp”+“ret”，分别代表“floating-point”和“return”。
 
 http://yulingtianxia.com/blog/2014/11/05/objective-c-runtime/#%E6%B6%88%E6%81%AF%E8%BD%AC%E5%8F%91
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dataSourceArray = @[
        @{
            @"title": @"objc_msgSend",
        },
        @{
            @"title": @"objc_msgSendSuper",
        },
        @{
            @"title": @"objc_msgSend_stret",
        },
        @{
            @"title": @"objc_msgSendSuper_stret",
        },
        @{
            @"title": @"objc_msgSend_fpret",
        },
        @{
            @"title": @"objc_msgSend_fp2ret",
        },
        @{
            @"title": @"消息转发",
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
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                /*
                 项目配置文件 -> Build Settings -> Enable Strict Checking of objc_msgSend Calls 这个字段默认为YES
                 此时直接使用objc_msgSend会有如下的结果

                 代码无参数提示
                 会报错

                 将配置文件的Yes-->No,效果如下,问题解决
                 
                 
                 还有一种解决方式无需更改项目配置文件(依然为Yes)
                 由于objc_msgSend函数本身是无返回值无参数的函数, 所以要给它强制转换类型代码如下:
                 
                 @selector(callMeNow)等价于sel_registerName("callMeNow"),都是SEL
            
                 作者：青椒辣不辣
                 链接：https://www.jianshu.com/p/264e477793fb
                 来源：简书
                 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
                 */
                DYSCat *cat = [DYSCat new];
//                objc_msgSend(cat,@selector(dys_saymiao));//Too many arguments to function call
                
                ((void (*) (id, SEL)) (void *)objc_msgSend)(cat, @selector(dys_saymiao));//miao ~
                ((void (*) (id, SEL)) (void *)objc_msgSend)(cat, sel_registerName("dys_saymiao"));//miao ~
            }
            break;
            
        default:
            break;
    }

    
        
    NSDictionary *dict = self.dataSourceArray[indexPath.row];
    NSString *title = [dict objectForKey:@"title"];
    if ([title isEqualToString:@"消息转发"]) {
        //
        DYSMessageSendViewController *vc = [DYSMessageSendViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}
@end
