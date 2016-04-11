//
//  TopViewController.m
//  scrollToTop
//
//  Created by pengshuai on 16/4/11.
//  Copyright © 2016年 iningfeng. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()


@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
}
//点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //触发window点击事件
    [self windowClick];
}



- (void)windowClick{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self searchScrollViewInView:window];
}

- (void)searchScrollViewInView:(UIView *)superView{
    //如果是scrollow，滚动到顶部
    for (UIScrollView *subView in superView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]] && [self isShowingOnKeyWindow:subView]) {
            CGPoint offset = subView.contentOffset;
            offset.y = - subView.contentInset.top;
            [subView setContentOffset:offset animated:YES];
        }
        //递归查找
        [self searchScrollViewInView:subView];
    }
}
- (BOOL)isShowingOnKeyWindow:(UIView *)view{
    //主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGRect newFrame = [keyWindow convertRect:view.frame fromView:view.superview];
    CGRect winBounds = keyWindow.bounds;
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    return !view.isHidden && view.alpha > 0.01 && view.window == keyWindow && intersects;
}


@end
