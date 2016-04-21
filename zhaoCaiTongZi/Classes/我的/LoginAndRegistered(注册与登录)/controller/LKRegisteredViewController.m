//
//  LKRegisteredViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/12.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKRegisteredViewController.h"

#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface LKRegisteredViewController ()

/** 手机号输入框 */
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
/** 验证码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *verificationTextField;
/** 密码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
/** 确认密码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *invitationTextField;
/** 验证按钮 */
@property (strong, nonatomic) IBOutlet UIButton *verificationBtn;

/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
/** 验证码秒数 */
@property (nonatomic,assign) NSInteger index;

@end

@implementation LKRegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
}


/**
 *  验证码事件
 */
- (IBAction)verificationClick:(UIButton *)sender {
    
    //验证码网络请求
    [self verificationNetWork];
    
    self.index = 60;
    [self addTimer];
}

//验证码网络请求
- (void)verificationNetWork
{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobileNumber"] = self.phoneTextField.text;
    params[@"version"] = VERSION;
    params[@"appName"] = @"financing";
    
    //发送请求
    [[AFHTTPSessionManager manager] POST:[NSString stringWithFormat:@"%@smsmt.do",testURL] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        LKLog(@"------%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LKLog(@"error ===== %@",error);
        [SVProgressHUD showErrorWithStatus:@"请求验证码失败"];
    }];

}

//添加定时器
-(void)addTimer
{
    [self.verificationBtn setUserInteractionEnabled:NO];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(textAction) userInfo:nil repeats:YES ];
    
}
-(void)textAction
{
    self.index--;
    [self.verificationBtn setTitle:[NSString stringWithFormat:@"%.2ld%@",(long)self.index,@"秒"] forState:UIControlStateNormal];
    self.verificationBtn.backgroundColor = [UIColor colorWithRed:213 / 255.0 green:213 / 255.0 blue:213 / 255.0 alpha:1];
    [self.verificationBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    if (self.index == 0) {
        //规定时间没结果，重试
        [self.verificationBtn setTitle:@"重试" forState:UIControlStateNormal];
        //btn回复可点
        [self.verificationBtn setUserInteractionEnabled:YES];
        [self.timer invalidate];
        self.verificationBtn.backgroundColor = [UIColor whiteColor];
        [self.verificationBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}
/**
 *  返回事件
 */
- (IBAction)backClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/**
 *  注册事件
 */
- (IBAction)registeredClick:(UIButton *)sender {
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobileNumber"] = self.phoneTextField.text;
    params[@"version"] = VERSION;
    params[@"pssword"] = self.passwordTextField.text;
    
    //发送请求
    [[AFHTTPSessionManager manager] POST:[NSString stringWithFormat:@"%@financingreg.do",testURL] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        LKLog(@"------%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LKLog(@"error ===== %@",error);
        [SVProgressHUD showErrorWithStatus:@"注册失败"];
    }];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
