//
//  LKTopUpViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/8.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKTopUpViewController.h"

#import <Masonry.h>

@interface LKTopUpViewController ()

/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
/** 验证码秒数 */
@property (nonatomic,assign) NSInteger index;
/** 温馨提示 */
@property (strong, nonatomic) UILabel *promptLabel;

@end

@implementation LKTopUpViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"充值";
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    
    [self setUpUI];
}

- (void)setUpUI
{
    //温馨提示
    self.promptLabel = [[UILabel alloc] init];
    self.promptLabel.text = @"温馨提示:\n1.为了您的账户安全，请在充值前进行身份认证，以及交易密码设置。\n2.为保障您的资金安全，认证充值与提现使用同卡进出原则，即提现银行卡需与认证充值银行卡一致。\n3.您的账户资金将由第三方资金托管平台管理，招财童子本身不会存放用户的资金。\n4.当前属于优惠期，用户无需支付充值费用。\n5.充值限额依据各银行限额为准。\n6.禁止洗钱、信用卡套现、虚假交易等行为，一经发现被确认，将终止该账户的使用。\n7.如果充钱金额没有及时到账，请联系客服，010-65180896";
    self.promptLabel.font = [UIFont systemFontOfSize:11.0];
    self.promptLabel.numberOfLines = 0;
    self.promptLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.promptLabel];
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topUpBtn.mas_bottom).offset(30);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-70);
        make.right.equalTo(self.view.mas_right).offset(-10);
    }];
    
}

/**
 *  充值按钮点击事件
 */
- (IBAction)topUpClick:(UIButton *)sender {
}

/**
 *  验证码按钮点击事件
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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
