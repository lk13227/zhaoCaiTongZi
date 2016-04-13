//
//  LKNavigationController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/6.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKNavigationController.h"

@interface LKNavigationController ()

@end

@implementation LKNavigationController

/**
 *  第一次调用这个类的时候会调用一次
 */
+ (void)initialize
{
    //设置导航背景图片
    //[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
//    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

//这里拦截所有push进来的控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animate
{
    
    if (self.childViewControllers.count) {//如果push进来的不是第一个控制器
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow@2x"] forState:UIControlStateNormal];
        //[button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        //        [button sizeToFit];
        button.size = CGSizeMake(70, 30);
        //让按钮所有的内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);//让按钮左偏移10
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        //隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animate];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}



@end
