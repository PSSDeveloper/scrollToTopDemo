//
//  PGTopWindow.m
//  scrollToTop
//
//  Created by pengshuai on 16/4/11.
//  Copyright © 2016年 iningfeng. All rights reserved.
//

#import "PGTopWindow.h"
#import <UIKit/UIKit.h>
#import "TopViewController.h"
@implementation PGTopWindow
//私有属性
static UIWindow *window_;

+ (void)initialize{
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor clearColor];
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window_.rootViewController = [TopViewController new];
    window_.windowLevel = UIWindowLevelAlert;
}

+ (void)show{
    window_.hidden = NO;
}

+ (void)hide{
    window_.hidden = YES;
}

@end
