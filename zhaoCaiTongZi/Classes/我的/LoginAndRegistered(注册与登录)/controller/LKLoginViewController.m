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

#import <SVProgressHUD.h>
#import <AFNetworking.h>

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
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobileNumber"] = self.phoneTextField.text;
    params[@"pssword"] = self.passwordTextField.text;
    params[@"version"] = VERSION;
    
    //发送请求
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json",nil];
    
    [manager POST:[NSString stringWithFormat:@"%@financinglogon.do",testURL] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        LKLog(@"%@",responseObject);
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LKLog(@"error ===== %@",error);
        [SVProgressHUD showErrorWithStatus:@"登录失败"];
    }];
    
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
