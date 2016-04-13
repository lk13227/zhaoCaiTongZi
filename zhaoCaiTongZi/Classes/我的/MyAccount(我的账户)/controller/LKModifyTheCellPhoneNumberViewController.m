//
//  LKModifyTheCellPhoneNumberViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/13.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKModifyTheCellPhoneNumberViewController.h"

@interface LKModifyTheCellPhoneNumberViewController ()

/** 密码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
/** 手机号输入框 */
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
/** 验证码输入框 */
@property (strong, nonatomic) IBOutlet UITextField *validationTextField;
/** 验证按钮 */
@property (strong, nonatomic) IBOutlet UIButton *validationButton;
/** 提交按钮 */
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
/** 验证码秒数 */
@property (nonatomic,assign) NSInteger *index;

@end

@implementation LKModifyTheCellPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


/**
 *  验证事件
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

/**
 *  提交事件
 */
- (IBAction)submitClick:(UIButton *)sender {
}

@end
