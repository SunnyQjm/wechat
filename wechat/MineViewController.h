//
//  MineViewController.h
//  wechat
//
//  Created by OurEDA on 2018/3/21.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColorUtil.h"
#import "WechatMainItem.h"

@interface MineViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableView;
    NSArray *status;
}

@end
