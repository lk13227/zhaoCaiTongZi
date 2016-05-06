//
//  LKForgotPasswordViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/12.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKForgotPasswordViewController.h"

#import <SVProgressHUD.h>
#import <AFNetworking.h>

@interface LKForgotPasswordViewController ()

/** 验证按钮 */
@property (strong, nonatomic) IBOutlet UIButton *validationBtn;
/** 手机号输入框 */
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
/** 验证码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *validationTextField;
/** 密码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
/** 验证码秒数 */
@property (nonatomic,assign) NSInteger index;

@end

@implementation LKForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
}


/**
 *  提交事件
 */
- (IBAction)submitClick:(UIButton *)sender {
    
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
    
    [manager POST:[NSString stringWithFormat:@"%@forgetpasswd.do",testURL] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        LKLog(@"%@",responseObject);
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LKLog(@"error ===== %@",error);
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];

}

/**
 *  验证码事件
 */
- (IBAction)validationClick:(UIButton *)sender {
    
    //验证码网络请求
    [self verificationNetWork];
    
    self.index = 60;
    [self addTimer];
}

- (void)verificationNetWork
{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobileNumber"] = self.phoneTextField.text;
    params[@"version"] = VERSION;
    params[@"appName"] = @"financing";
    
    //发送请求
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json",nil];
    
    [manager POST:[NSString stringWithFormat:@"%@smsmt.do",testURL] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        LKLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LKLog(@"error ===== %@",error);
        [SVProgressHUD showErrorWithStatus:@"失败"];
    }];

}

//添加定时器
-(void)addTimer
{
    [self.validationBtn setUserInteractionEnabled:NO];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(textAction) userInfo:nil repeats:YES ];
    
}
-(void)textAction
{
    self.index--;
    [self.validationBtn setTitle:[NSString stringWithFormat:@"%.2ld%@",(long)self.index,@"秒"] forState:UIControlStateNormal];
    self.validationBtn.backgroundColor = [UIColor colorWithRed:213 / 255.0 green:213 / 255.0 blue:213 / 255.0 alpha:1];
    [self.validationBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    if (self.index == 0) {
        //规定时间没结果，重试
        [self.validationBtn setTitle:@"重试" forState:UIControlStateNormal];
        //btn回复可点
        [self.validationBtn setUserInteractionEnabled:YES];
        [self.timer invalidate];
        self.validationBtn.backgroundColor = [UIColor whiteColor];
        [self.validationBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}

/**
 *  返回事件
 */
- (IBAction)backClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
