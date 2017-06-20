//
//  BaseTabBar.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "BaseTabBar.h"

@interface BaseTabBar ()

@property (nonatomic, weak)UIButton *plusButton;
@end

@implementation BaseTabBar
@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加一个按钮到tabbar中
        UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusButton = plusBtn;
    }
    return self;
}

- (void)plusClick {
    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    //设置加号按钮的位置
    self.plusButton.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    //设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = CGRectGetWidth(self.bounds) / 5;
    CGFloat tabbarButtonIndex = 0;
    
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            //设置宽度
            child.width = tabbarButtonW;
            //设置x
            child.x = tabbarButtonIndex * tabbarButtonW;
            
            //增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}

@end
