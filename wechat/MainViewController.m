//
//  MainViewController.m
//  wechat
//
//  Created by OurEDA on 2018/3/21.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];

    self.navigationController.navigationBar.barTintColor = [UIColorUtil barColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"微信(3)";
    status = @[[[WechatMainItemStatus alloc]
            initWithImagePath:@"2.jpg" withName:@"name"
                  withMessage:@"messagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessage"],
            [[WechatMainItemStatus alloc] initWithImagePath:@"mine.png" withName:@"name" withMessage:@"messagemessagemessagemessage"],
            [[WechatMainItemStatus alloc] initWithImagePath:@"2.jpg" withName:@"name" withMessage:@"messagemessagemessagemessage"],
            [[WechatMainItemStatus alloc] initWithImagePath:@"mine.png" withName:@"name" withMessage:@"messagemessagemessagemessage"],
            [[WechatMainItemStatus alloc] initWithImagePath:@"2.jpg" withName:@"name" withMessage:@"messagemessagemessagemessage"],
            [[WechatMainItemStatus alloc] initWithImagePath:@"mine.png" withName:@"name" withMessage:@"messagemessagemessagemessage"],
            [[WechatMainItemStatus alloc] initWithImagePath:@"2.jpg" withName:@"name" withMessage:@"messagemessagemessagemessage"]];

    //开始布局
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColorUtil lightGreyBg];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)uiTableView numberOfRowsInSection:(NSInteger)section {
    return [status count];
}

- (CGFloat)tableView:(UITableView *)uiTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((WechatMainItemStatus *)status[(NSUInteger) indexPath.row]).cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)uiTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WechatMainItem *item = [[WechatMainItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myReuseFlag"];
    [item initStatus:status[(NSUInteger) indexPath.row]];
    return item;
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
