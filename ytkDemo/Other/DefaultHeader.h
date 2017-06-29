
//
//  DefaultHeader.h
//  ytkDemo
//
//  Created by Jack Mo on 16/12/8.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#ifndef DefaultHeader_h
#define DefaultHeader_h

#import "UIColor+Utils.h"

#pragma mark -系统UI

///当前屏幕宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

///当前屏幕高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#define kStatusBarHeight 20

#define kNavigationBarHeight 64

#define kTabBarHeight 49

///普通字体
#define kFont(size) [UIFont systemFontOfSize:size]

///粗体
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]

#pragma mark -颜色

///白色
#define kWhiteColor [UIColor whiteColor]

///主题色
#define kMainColor [UIColor colorForHex:@"27B5EE"]




///弱指针
#define WeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self

#endif /* DefaultHeader_h */
