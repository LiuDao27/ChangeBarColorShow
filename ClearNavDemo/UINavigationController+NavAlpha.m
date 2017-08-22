//
//  UINavigationController+NavAlpha.m
//  ClearNavDemo
//
//  Created by lvshasha on 2017/8/15.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "UINavigationController+NavAlpha.h"
#import "UINavigationBar+NavAlpha.h"

static char *shadowKey = "shadowKey";
@implementation UINavigationController (NavAlpha)
// UINavigationBar
- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item
{
    navigationBar.tintColor = self.topViewController.navBarTitleColor;
    navigationBar.barTintColor = self.topViewController.navBarColor;
    navigationBar.navAlpha = self.topViewController.navAlpha;
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item
{
    navigationBar.tintColor = self.topViewController.navBarTitleColor;
    navigationBar.barTintColor = self.topViewController.navBarColor;
    navigationBar.navAlpha = self.topViewController.navAlpha;
    return YES;
}

- (BOOL)isHideShadow
{
    return [objc_getAssociatedObject(self, shadowKey) boolValue];
}

- (void)setHideShadow:(BOOL)hideShadow
{
    self.navigationBar.hideShadow = hideShadow;
    objc_setAssociatedObject(self, shadowKey, @(hideShadow), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end


#pragma mark UIViewConttoller + NavAlpha
//
static char *vcAlpha = "vcAlpha";
static char *vcColor = "vcColor";
static char *vcNavTitleColor = "vcNavTitleColor";
//
@implementation UIViewController (NavAlpha)
// 透明度
- (CGFloat)navAlpha
{
    if (objc_getAssociatedObject(self, vcAlpha) == nil) {
        return 1;
    }
    return [objc_getAssociatedObject(self, vcAlpha) floatValue];
}

- (void)setNavAlpha:(CGFloat)navAlpha
{
    CGFloat alpha = MAX(MIN(navAlpha, 1), 0);
    self.navigationController.navigationBar.navAlpha = alpha;
    objc_setAssociatedObject(self, vcAlpha, @(alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 背景颜色
- (UIColor *)navBarColor
{
    UIColor *color = objc_getAssociatedObject(self, vcColor);
    if (color == nil) {
        color = [UINavigationBar appearance].barTintColor;
    }
    return color;
}

- (void)setNavBarColor:(UIColor *)navBarColor
{
    self.navigationController.navigationBar.barTintColor = navBarColor;
    objc_setAssociatedObject(self, vcColor, navBarColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 字体颜色
- (UIColor *)navBarTitleColor
{
    UIColor *color = objc_getAssociatedObject(self, vcNavTitleColor);
    if (color == nil) {
        color = [UINavigationBar appearance].tintColor;
    }
    return color;
}

- (void)setNavBarTitleColor:(UIColor *)navBarTitleColor
{
    self.navigationController.navigationBar.tintColor = navBarTitleColor;
    objc_setAssociatedObject(self, vcNavTitleColor, navBarTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

