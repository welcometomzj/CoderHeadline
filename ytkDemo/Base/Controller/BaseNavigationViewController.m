//
//  BaseNavigationViewController.m
//  ytkDemo
//
//  Created by Jack Mo on 16/12/9.
//  Copyright © 2016年 Jack Mo. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+ (void)initialize {
    //设置为不透明
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //设置导航来背景颜色
    [UINavigationBar appearance].barTintColor = kMainColor;
    
    //设置导航栏标题颜色
    NSMutableDictionary *colorParam = [NSMutableDictionary dictionary];
    colorParam[NSFontAttributeName] = kFont(17.0f);
    colorParam[NSForegroundColorAttributeName] = kWhiteColor;
    [[UINavigationBar appearance] setTitleTextAttributes:colorParam];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        [btn setImage:[UIImage imageNamed:@"btn_icon_navi_back"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
