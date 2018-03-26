//
// Created by OurEDA on 2018/3/21.
// Copyright (c) 2018 OurEDA. All rights reserved.
//

#import "WechatMainItem.h"
#import "UIColorUtil.h"

@implementation WechatMainItemStatus {

}

- (instancetype)initWithImagePath:(NSString *)icon withName:(NSString *)name withMessage:(NSString *)message {
    self.icon = icon;
    self.name = name;
    self.message = message;

    NSInteger margin = 10;
    NSInteger imgSize = 50;
    CGFloat cellHeight = 2 * margin + imgSize;

    //calculateCellHeight
    //计算单行
    CGSize nameSize = [self.name sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]}];
    CGSize messageSize = [self.message sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]}];
//    //计算多行
//    CGRect nameReact = [self.name boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 3 * margin - imgSize, MAXFLOAT)
//                                               options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.f]} context:nil];
//    CGRect messageReact = [self.message boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 3 * margin - imgSize, MAXFLOAT)
//                                                     options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.f]} context:nil];

    if (2 * margin + nameSize.height + messageSize.height > cellHeight) {
        cellHeight = 2 * margin + nameSize.height + messageSize.height;
    }
    self.cellHeight = cellHeight;

    //initFrame
    self.imgAvatarFrame = CGRectMake(margin, margin + (cellHeight - 2 * margin - imgSize) / 2, imgSize, imgSize);
    self.nameFrame = CGRectMake(2 * margin + imgSize, margin, nameSize.width, nameSize.height);
    self.messageFrame = CGRectMake(2 * margin + imgSize, 2 * margin + nameSize.height, messageSize.width, messageSize.height);
    return self;
}


@end


@implementation WechatMainItem {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imgAvatar = [[UIImageView alloc] initWithImage:[[UIImage alloc] init]];
        [self.contentView addSubview:imgAvatar];
        self.imgAvatar = imgAvatar;

        UILabel *labelName = [[UILabel alloc] init];
        [self.contentView addSubview:labelName];
        self.labelName = labelName;
        labelName.font = [UIFont systemFontOfSize:16.f];

        UILabel *labelMessage = [[UILabel alloc] init];
        [self.contentView addSubview:labelMessage];
        labelMessage.textColor = [UIColor grayColor];
        self.labelMessage = labelMessage;
        self.labelMessage.font = [UIFont systemFontOfSize:16.f];
        self.backgroundColor = [UIColor whiteColor];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_status) {
        self.imgAvatar.frame = _status.imgAvatarFrame;
        self.labelName.frame = _status.nameFrame;
        self.labelMessage.frame = _status.messageFrame;
    }

}

- (void)initStatus:(WechatMainItemStatus *)status {
    self.imgAvatar.image = [UIImage imageNamed:status.icon];
    self.labelName.text = status.name;
    self.labelMessage.text = status.message;
    self.status = status;
}

@end


@implementation WechatSingleItemStatus {

}
+ (NSInteger)TYPE_NORMAL {
    return 0;
}

+ (NSInteger)TYPE_TAG {
    return 1;
}

+ (NSInteger)TYPE_USER_ITEM {
    return 2;
}

- (instancetype)initWithImgName:(NSString *)imgName name:(NSString *)name imgSize:(CGFloat)imgSize type:(NSInteger)type
                       fontSize:(CGFloat)fontSize {
    self.imgName = imgName;
    self.name = name;
    self.type = [WechatSingleItemStatus TYPE_NORMAL];
    if (type == [WechatSingleItemStatus TYPE_TAG]) {
        self.type = [WechatSingleItemStatus TYPE_TAG];
    }

    self.fontSize = fontSize;
    //计算布局的位置
    NSInteger margin = 10;
    CGFloat cellHeight = 2 * margin + imgSize;
    CGSize nameSize = [self.name sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    if ([name isEqualToString:@""]) {
        nameSize.height = 0;
    }
    if (nameSize.height > imgSize || self.type == [WechatSingleItemStatus TYPE_TAG]) {
        cellHeight = 2 * margin + nameSize.height;
    }

    self.cellHeight = cellHeight;
    if (self.type == [WechatSingleItemStatus TYPE_NORMAL]) {
        self.imgAvatarFrame = CGRectMake(margin, (cellHeight - imgSize) / 2, imgSize, imgSize);
        self.nameFrame = CGRectMake(margin * 2 + imgSize, (cellHeight - nameSize.height) / 2, nameSize.width, nameSize.height);
    } else if (self.type == [WechatSingleItemStatus TYPE_TAG]) {
        //不显示头像
        self.imgAvatarFrame = CGRectMake(0, 0, 0, 0);
        self.nameFrame = CGRectMake(margin, (cellHeight - nameSize.height) / 2, nameSize.width, nameSize.height);
    }
    self.weChatNumberFrame = CGRectMake(0, 0, 0, 0);
    self.imgScanFrame = CGRectMake(0, 0, 0, 0);

    return self;
}

- (instancetype)initWithImgName:(NSString *)imgName name:(NSString *)name imgSize:(CGFloat)imgSize weChatNumber:(NSString *)weChatNumber fontSize:(CGFloat)fontSize {
    self.imgName = imgName;
    self.name = name;
    self.weChatNumber = weChatNumber;
    self.type = [WechatSingleItemStatus TYPE_USER_ITEM];

    self.fontSize = fontSize;
    //计算布局的位置
    NSInteger margin = 10;
    CGFloat cellHeight = 2 * margin + imgSize;
    CGSize nameSize = [self.name sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    CGSize weChatNumberSize = [self.weChatNumber sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];

    NSLog(@"%f", weChatNumberSize.height);
    NSLog(@"%f", weChatNumberSize.width);
    if (nameSize.height + weChatNumberSize.height + margin / 2 > imgSize) {
        cellHeight = 2 * margin + nameSize.height;
    }

    self.cellHeight = cellHeight;
    CGFloat textMargin = (cellHeight - (nameSize.height + weChatNumberSize.height + margin / 2)) / 2;
    self.imgAvatarFrame = CGRectMake(margin, (cellHeight - imgSize) / 2, imgSize, imgSize);
    self.nameFrame = CGRectMake(margin * 2 + imgSize, textMargin, nameSize.width, nameSize.height);
    self.weChatNumberFrame = CGRectMake(margin * 2 + imgSize, textMargin + margin / 2 + nameSize.height, weChatNumberSize.width, weChatNumberSize.height);
    self.imgScanFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30 - margin, (cellHeight - 30) / 2, 30, 30);
    return self;
}


@end

@implementation WechatSingleItem

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:imgView];
        self.imgAvatar = imgView;

        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        self.labelName = label;

        UILabel *labelWeChatNumber = [[UILabel alloc] init];
        [self.contentView addSubview:labelWeChatNumber];
        self.labelWeChatNumber = labelWeChatNumber;

        UIImageView *imgScan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"erweima.png"]];
        [self.contentView addSubview:imgScan];
        self.imgScan = imgScan;
    }

    return self;
}

- (void)layoutSubviews {
    //布局
    [super layoutSubviews];
    if (_status) {
        _imgAvatar.frame = _status.imgAvatarFrame;
        _labelName.frame = _status.nameFrame;
        _labelWeChatNumber.frame = _status.weChatNumberFrame;
        _imgScan.frame = _status.imgScanFrame;
    }
}

- (void)initStatus:(WechatSingleItemStatus *)status {
    _imgAvatar.image = [UIImage imageNamed:status.imgName];
    _labelName.text = status.name;
    self.labelName.font = [UIFont systemFontOfSize:status.fontSize];
    _status = status;
    if (_status.type == [WechatSingleItemStatus TYPE_TAG]) {
        self.contentView.backgroundColor = [UIColorUtil lightGreyBg];
        self.labelName.textColor = [UIColor grayColor];
    } else if (_status.type == [WechatSingleItemStatus TYPE_USER_ITEM]) {
        _labelWeChatNumber.text = status.weChatNumber;
        _labelWeChatNumber.textColor = [UIColor grayColor];
    }
}

@end
