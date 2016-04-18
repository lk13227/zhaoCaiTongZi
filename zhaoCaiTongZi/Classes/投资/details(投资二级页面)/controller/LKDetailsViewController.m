//
//  LKDetailsViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/13.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKDetailsViewController.h"

#import "LKBuyViewController.h"
#import "LKLadderRatesViewController.h"

@interface LKDetailsViewController ()

@end

@implementation LKDetailsViewController

- (void)viewWillAppear:(BOOL)animated
{
    //set NavigationBar 背景颜色&title 颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
}

/**
 *  利率按钮
 */
- (IBAction)ladderRatesClick {
    LKLadderRatesViewController *ladderRatesVC = [[LKLadderRatesViewController alloc] init];
    ladderRatesVC.navigationItem.title = @"投资资金阶梯利率";
    [self.navigationController pushViewController:ladderRatesVC animated:YES];
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
