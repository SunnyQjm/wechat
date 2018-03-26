//
//  FindViewController.m
//  wechat
//
//  Created by OurEDA on 2018/3/21.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColorUtil lightGreyBg];
    self.navigationController.navigationBar.barTintColor = [UIColorUtil barColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"发现";
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"微信(3)" style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.leftBarButtonItem = btn;
    status = @[
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"friend_circle.png" name:@"朋友圈" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"scan.png" name:@"扫一扫" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"shake_shake.png" name:@"摇一摇" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"look_look.png" name:@"看一看" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"search_search.png" name:@"搜一搜" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"people_nearby.png" name:@"附近的人" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"drifting_bottle.png" name:@"漂流瓶" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"shopping.png" name:@"购物" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"game.png" name:@"游戏" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"little_program.png" name:@"游戏" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f]
    ];

    //开始布局
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColorUtil lightGreyBg];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
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
