//
//  LKChangeThePasswordViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/13.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKChangeThePasswordViewController.h"

@interface LKChangeThePasswordViewController ()

/** 原密码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
/** 新密码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *NewPasswordTextField;
/** 手机号输入框 */
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
/** 验证码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *validationTextField;
/** 验证按钮 */
@property (strong, nonatomic) IBOutlet UIButton *validationButton;

/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
/** 验证码秒数 */
@property (nonatomic,assign) NSInteger *index;

@end

@implementation LKChangeThePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
}

/**
 *  提交事件
 */
- (IBAction)submitClick:(UIButton *)sender {
}

/**
 *  验证按钮
 */
- (IBAction)validationClick:(UIButton *)sender {
    self.index = 60;
    [self addTimer];
}
//添加定时器
-(void)addTimer
{
    [self.validationButton setUserInteractionEnabled:NO];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(textAction) userInfo:nil repeats:YES ];
    
}
-(void)textAction
{
    self.index--;
    [self.validationButton setTitle:[NSString stringWithFormat:@"%.2ld%@",(long)self.index,@"秒"] forState:UIControlStateNormal];
    self.validationButton.backgroundColor = [UIColor colorWithRed:213 / 255.0 green:213 / 255.0 blue:213 / 255.0 alpha:1];
    [self.validationButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    if (self.index == 0) {
        //规定时间没结果，重试
        [self.validationButton setTitle:@"重试" forState:UIControlStateNormal];
        //btn回复可点
        [self.validationButton setUserInteractionEnabled:YES];
        [self.timer invalidate];
        self.validationButton.backgroundColor = [UIColor whiteColor];
        [self.validationButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
