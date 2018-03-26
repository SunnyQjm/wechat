//
// Created by OurEDA on 2018/3/22.
// Copyright (c) 2018 OurEDA. All rights reserved.
//

#import "UIColorUtil.h"


@implementation UIColorUtil {

}

+ (UIColor *)bottomBarTintColor {
    return [UIColorUtil getColorWithR:70 G:193 B:27 A:1.0];
}
+ (UIColor *)barColor {
    return [UIColorUtil getColorWithR:57 G:58 B:63 A:1.0];
}

+ (UIColor *)lightGreyBg {
    return [UIColorUtil getColorWithR:235 G:235 B:235 A:1.0];
}

+ (UIColor *)getColorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(CGFloat)alpha {
    CGFloat r  = (CGFloat) red/255.0;
    CGFloat g = (CGFloat) green/255.0;
    CGFloat b = (CGFloat) blue/255.0;
    return [UIColor colorWithRed:r  green:g blue:b alpha:alpha];
}


@end