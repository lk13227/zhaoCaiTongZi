//
//  LKDetailsViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/13.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKDetailsViewController.h"

#import "LKBuyViewController.h"

@interface LKDetailsViewController ()

@end

@implementation LKDetailsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    //set NavigationBar 背景颜色&title 颜色
//    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


/**
 *  购买按钮
 */
- (IBAction)buyClick {
    LKBuyViewController *buyVC = [[LKBuyViewController alloc] init];
    buyVC.navigationItem.title = @"购买";
    [self.navigationController pushViewController:buyVC animated:YES];
}

@end
