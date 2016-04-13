//
//  LKRegisteredViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/12.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKRegisteredViewController.h"

@interface LKRegisteredViewController ()

/** 手机号输入框 */
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
/** 验证码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *verificationTextField;
/** 密码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
/** 邀请码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *invitationTextField;
/** 验证按钮 */
@property (strong, nonatomic) IBOutlet UIButton *verificationBtn;

/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
/** 验证码秒数 */
@property (nonatomic,assign) NSInteger *index;

@end

@implementation LKRegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


/**
 *  验证码事件
 */
- (IBAction)verificationClick:(UIButton *)sender {
    self.index = 60;
    [self addTimer];
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
}

@end
