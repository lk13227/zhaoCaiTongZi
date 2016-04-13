//
//  LKTabBarController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/6.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKTabBarController.h"

#import "LKNavigationController.h"
#import "selectViewController.h"
#import "InvestmentViewController.h"
#import "AssetsViewController.h"
#import "MyViewController.h"

@interface LKTabBarController ()

@end

@implementation LKTabBarController

+ (void)initialize
{
    //通过appearance设置所有item的属性
    //后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = LKRGBColor(251.0, 92.0, 79.0);
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self setupChildVc:[[selectViewController alloc] init] title:@"精选" image:@"widget_bar_news_nor" selectedImage:@"widget_bar_news_over"];
    
    [self setupChildVc:[[InvestmentViewController alloc] init] title:@"投资" image:@"widget_bar_tweet_nor" selectedImage:@"widget_bar_tweet_over"];
    
    [self setupChildVc:[[AssetsViewController alloc] init] title:@"资产" image:@"widget_bar_explore_nor" selectedImage:@"widget_bar_explore_over"];
    
    [self setupChildVc:[[MyViewController alloc] init] title:@"我的" image:@"widget_bar_me_nor" selectedImage:@"widget_bar_me_over"];
    
    //更换tabbar
    //[self setValue:[[LKTabBar alloc] init] forKeyPath:@"tabBar"];
}


/**
 *  初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //vc.view.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:223.0/255.0 blue:223.0/255.0 alpha:1.0];这里不能设置颜色，会导致控制器提前创建
    //包装一个导航控制器，添加导航控制器为tabbarController的子控制器
    LKNavigationController *nav = [[LKNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}


@end
