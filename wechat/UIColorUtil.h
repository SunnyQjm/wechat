//
// Created by OurEDA on 2018/3/22.
// Copyright (c) 2018 OurEDA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColorUtil : NSObject{
}
@property(class, nonatomic, assign, readonly) UIColor *barColor;
@property(class, nonatomic, assign, readonly) UIColor *bottomBarTintColor;
@property(class, nonatomic, assign, readonly) UIColor *lightGreyBg;

+ (UIColor *)getColorWithR: (NSInteger) red G: (NSInteger) green B: (NSInteger)blue A: (CGFloat) alpha;
@end