//
//  LKForgotPasswordViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/12.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKForgotPasswordViewController.h"

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
@property (nonatomic,assign) NSInteger *index;

@end

@implementation LKForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


/**
 *  提交事件
 */
- (IBAction)submitClick:(UIButton *)sender {
}

/**
 *  验证码事件
 */
- (IBAction)validationClick:(UIButton *)sender {
    self.index = 60;
    [self addTimer];
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

@end
