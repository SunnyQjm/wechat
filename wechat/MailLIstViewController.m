//
//  MailLIstViewController.m
//  wechat
//
//  Created by OurEDA on 2018/3/21.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "MailLIstViewController.h"

@interface MailLIstViewController ()

@end

@implementation MailLIstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColorUtil lightGreyBg];
    self.navigationController.navigationBar.barTintColor = [UIColorUtil barColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"通讯录";
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"微信(3)" style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.leftBarButtonItem = btn;

    status = @[
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"add_friend.png" name:@"新的朋友" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"group_chat_.png" name:@"群聊" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"tag.png" name:@"标签" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"public_number.png" name:@"公众号" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"星标朋友" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"pig.jpg" name:@"老朱1号" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"L" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"pig.jpg" name:@"老朱2号" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"pig.jpg" name:@"老朱3号" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"pig.jpg" name:@"老朱4号" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f]
    ];
    //开始布局
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColorUtil lightGreyBg];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.separatorColor = [UIColor lightGrayColor];
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section {
    return [status count];
}

- (CGFloat)tableView:(UITableView *)tableView1 heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((WechatSingleItemStatus *)status[(NSUInteger) indexPath.row]).cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WechatSingleItem *item = [[WechatSingleItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myReuseFlag"];
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
