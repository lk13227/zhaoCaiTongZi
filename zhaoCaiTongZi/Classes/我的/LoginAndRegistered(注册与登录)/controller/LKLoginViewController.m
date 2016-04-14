//
//  LKLoginViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/12.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKLoginViewController.h"

#import "LKRegisteredViewController.h"
#import "LKForgotPasswordViewController.h"

@interface LKLoginViewController ()

/** 手机号输入框 */
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
/** 密码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
}


/**
 *  忘记密码
 */
- (IBAction)forgotPasswordClick:(UIButton *)sender {
    LKForgotPasswordViewController *forgotPasswordVC = [[LKForgotPasswordViewController alloc] init];
    [self presentViewController:forgotPasswordVC animated:YES completion:nil];
}

/**
 *  注册事件
 */
- (IBAction)registeredClick:(UIButton *)sender {
    LKRegisteredViewController *registeredVC = [[LKRegisteredViewController alloc] init];
    [self presentViewController:registeredVC animated:YES completion:nil];
}

/**
 *  登录事件
 */
- (IBAction)loginClick:(UIButton *)sender {
}

/**
 *  返回事件
 */
- (IBAction)backClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
