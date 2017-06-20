//
//  BaseTabBarViewController.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "ReadingController.h"
#import "MessageViewController.h"
#import "ShareViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "BaseTabBar.h"
#import "BaseNavigationViewController.h"

@interface BaseTabBarViewController ()<BaseTabBarDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化子控制器
    ReadingController *read = [[ReadingController alloc] init];
    [self addChildVc:read title:@"阅读" image:@"tab_icon_featured" selectImage:@"tab_icon_featured_selected"];
    
    MessageViewController *message = [[MessageViewController alloc] init];
    [self addChildVc:message title:@"消息" image:@"tab_icon_message" selectImage:@"tab_icon_message_selected"];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"tab_icon_search" selectImage:@"tab_icon_search_selected"];
    
    MineViewController *mine = [[MineViewController alloc] init];
    [self addChildVc:mine title:@"我的" image:@"tab_icon_account" selectImage:@"tab_icon_account_selected"];
    
    //更换系统自带的tabbar
    BaseTabBar *tabBar = [[BaseTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}


/**
 *  添加一个子控制器
 *  
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectedImage {
    //设置子控制器的标题
    childVc.title = title;
    
    //设置icon
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorForHex:@"333333"];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = kMainColor;
    
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateHighlighted];
    
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
}

- (void)tabBarDidClickPlusButton:(BaseTabBar *)tabBar {
    ShareViewController *share = [[ShareViewController alloc] init];
    [self presentViewController:share animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
