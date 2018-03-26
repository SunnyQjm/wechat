//
// Created by OurEDA on 2018/3/21.
// Copyright (c) 2018 OurEDA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface WechatMainItemStatus: NSObject
@property (assign, nonatomic) NSString *icon;
@property (assign, nonatomic) NSString *name;
@property (assign, nonatomic) NSString *message;
@property (assign, nonatomic) CGRect imgAvatarFrame;
@property (assign, nonatomic) CGRect nameFrame;
@property (assign, nonatomic) CGRect messageFrame;
@property (assign, nonatomic) CGFloat cellHeight;

- (instancetype) initWithImagePath: (NSString *)icon withName: (NSString *)name withMessage: (NSString *)message;
@end


@interface WechatMainItem : UITableViewCell

@property (weak, nonatomic) UIImageView *imgAvatar;
@property (weak, nonatomic) UILabel *labelName;
@property (weak, nonatomic) UILabel *labelMessage;
@property (assign, nonatomic) WechatMainItemStatus *status;
- (void)initStatus: (WechatMainItemStatus *)status;
@end


@interface WechatSingleItemStatus: NSObject
@property (assign, nonatomic) NSString *imgName;
@property (assign, nonatomic) NSString *name;
@property (assign, nonatomic) CGRect imgAvatarFrame;
@property (assign, nonatomic) CGRect nameFrame;
@property (assign, nonatomic) NSInteger type;
@property (assign, nonatomic) CGFloat fontSize;
@property (class, readonly) NSInteger TYPE_NORMAL;
@property (class, readonly) NSInteger TYPE_TAG;
@property (class, readonly) NSInteger TYPE_USER_ITEM;
@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) CGRect weChatNumberFrame;
@property (assign, nonatomic) NSString *weChatNumber;
@property (assign, nonatomic) CGRect imgScanFrame;
- (instancetype)initWithImgName:(NSString *)imgName name:(NSString *)name imgSize:(CGFloat)imgSize type:(NSInteger)type
                       fontSize: (CGFloat) fontSize;
- (instancetype)initWithImgName:(NSString *)imgName name:(NSString *)name imgSize:(CGFloat)imgSize weChatNumber: (NSString *) weChatNumber
                       fontSize: (CGFloat) fontSize;
@end


@interface WechatSingleItem: UITableViewCell
@property (weak, nonatomic) UIImageView *imgAvatar;
@property (weak, nonatomic) UIImageView *imgScan;
@property (weak, nonatomic) UILabel *labelName;
@property (weak, nonatomic) UILabel *labelWeChatNumber;
@property (assign, nonatomic) WechatSingleItemStatus *status;
- (void)initStatus: (WechatSingleItemStatus *)status;
@end
