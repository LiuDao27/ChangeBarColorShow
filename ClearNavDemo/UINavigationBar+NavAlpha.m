//
//  UINavigationBar+NavAlpha.m
//  ClearNavDemo
//
//  Created by lvshasha on 2017/8/15.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import "UINavigationBar+NavAlpha.h"

@implementation UINavigationBar (NavAlpha)

static char *navAlphaa = "navAlphaa";
static char *shawdowKey = "shawdowKey";

- (CGFloat)navAlpha
{
    if (objc_getAssociatedObject(self, navAlphaa) == nil) {
        return 1;
    }
    return [objc_getAssociatedObject(self, navAlphaa) floatValue];
}

- (void)setNavAlpha:(CGFloat)navAlpha
{
    CGFloat alpha = MAX(MIN(navAlpha, 1), 0);
    
    UIView *barBackground = self.subviews[0];
    
    if (self.translucent == NO || [self backgroundImageForBarMetrics:UIBarMetricsDefault] != nil) {
        barBackground.alpha = alpha;
    } else {
        if ([[[UIDevice currentDevice]systemVersion] floatValue] >= 10.0) {
            UIView *effectivFiterView = barBackground.subviews.lastObject;
            effectivFiterView.alpha = alpha;
        } else {
            UIView *effectivFiterView = barBackground.subviews.firstObject;
            effectivFiterView.alpha = alpha;
        }
    }
    
    if ([barBackground valueForKey:@"_shadowView"]) {
        UIView *shadowView = [barBackground valueForKey:@"_shadowView"];
        shadowView.alpha = alpha;
    }
    
    objc_setAssociatedObject(self, navAlphaa, @(alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (BOOL)hideShadow
{
    return [objc_getAssociatedObject(self, shawdowKey) boolValue];
}

- (void)setHideShadow:(BOOL)hideShadow
{
    UIView *barBackground = self.subviews[0];
    if ([barBackground valueForKey:@"_shadowView"]) {
        UIView *shadowView = [barBackground valueForKey:@"_shadowView"];
        shadowView.hidden = hideShadow;
    }
    objc_setAssociatedObject(self, shawdowKey, @(hideShadow), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
