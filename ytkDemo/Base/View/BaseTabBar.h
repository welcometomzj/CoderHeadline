//
//  BaseTabBar.h
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTabBar;

@protocol BaseTabBarDelegate <UITabBarDelegate>

@optional
- (void)tabBarDidClickPlusButton:(BaseTabBar *)tabBar;
@end

@interface BaseTabBar : UITabBar

@property (nonatomic, weak) id<BaseTabBarDelegate> delegate;
@end
