//
//  MineViewController.m
//  wechat
//
//  Created by OurEDA on 2018/3/21.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColorUtil lightGreyBg];
    self.navigationController.navigationBar.barTintColor = [UIColorUtil barColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"我";
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"微信(3)" style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.leftBarButtonItem = btn;

    status = @[
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"pig.jpg" name:@"Robbin" imgSize:60.f weChatNumber:@"C253" fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"wallet.png" name:@"钱包" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"collection.png" name:@"收藏" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"picture.png" name:@"相册" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"card_packet.png" name:@"卡包" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"emoji.png" name:@"表情" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"" name:@"" imgSize:0.f type:[WechatSingleItemStatus TYPE_TAG] fontSize:12.f],
            [[WechatSingleItemStatus alloc] initWithImgName:@"setting.png" name:@"设置" imgSize:40.f type:[WechatSingleItemStatus TYPE_NORMAL] fontSize:18.f]
    ];

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
