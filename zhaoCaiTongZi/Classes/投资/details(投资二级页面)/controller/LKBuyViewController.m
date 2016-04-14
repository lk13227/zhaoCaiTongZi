//
//  LKBuyViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/13.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKBuyViewController.h"

@interface LKBuyViewController ()

@end

@implementation LKBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
