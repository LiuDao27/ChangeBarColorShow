//
//  UINavigationController+NavAlpha.h
//  ClearNavDemo
//
//  Created by lvshasha on 2017/8/15.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (NavAlpha)<UINavigationBarDelegate>

@end

@interface UIViewController (NavAlpha)
// 导航栏透明度
@property (nonatomic, assign) CGFloat navAlpha;
// 导航栏背景色
@property (nonatomic, strong) UIColor *navBarColor;
// 导航栏字体颜色
@property (nonatomic, strong) UIColor *navBarTitleColor;
@end
