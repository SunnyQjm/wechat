//
//  MailLIstViewController.h
//  wechat
//
//  Created by OurEDA on 2018/3/21.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WechatMainItem.h"
#import "UIColorUtil.h"

@interface MailLIstViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableView;
    NSArray *status;
}

@end
