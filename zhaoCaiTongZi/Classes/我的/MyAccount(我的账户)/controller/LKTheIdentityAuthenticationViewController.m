//
//  LKTheIdentityAuthenticationViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/13.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKTheIdentityAuthenticationViewController.h"

#import <Masonry.h>

@interface LKTheIdentityAuthenticationViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

/** 姓名textfield */
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
/** 身份证号textfield */
@property (strong, nonatomic) IBOutlet UITextField *idNumberTextField;
/** 选择银行label */
@property (strong, nonatomic) IBOutlet UILabel *chooseABankLabel;
/** 选择银行button */
@property (strong, nonatomic) IBOutlet UIButton *chooseABankBtn;
/** 银行卡号textfield */
@property (strong, nonatomic) IBOutlet UITextField *bankCardNumberTextField;
/** 选择银行选择器 */
@property (strong, nonatomic) UIPickerView *pickerView;
/** 银行数组 */
@property (strong, nonatomic) NSArray *backArray;
/** 判断是否点击银行按钮 */
@property (assign, nonatomic, getter=isBack) BOOL back;

@end

@implementation LKTheIdentityAuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.back = YES;
    self.backArray = @[@"中国银行",@"中国建设银行",@"中国工商银行",@"中国农业银行",@"招商银行",@"交通银行",@"中国农业银行",@"邮政储蓄银行",@"北京银行"];
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
}


/**
 *  选择银行
 */
- (IBAction)chooseABankClick:(UIButton *)sender {
    
    if (self.isBack == YES) {
        
        self.pickerView = [[UIPickerView alloc] init];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [self.view addSubview:self.pickerView];
        [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_bottom).offset(-120);
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            make.height.offset(120);
        }];
        
        self.back = NO;
        
    } else {
        
        [self.pickerView removeFromSuperview];
        
        self.back = YES;
        
    }
    
}

#pragma mark - pickerView
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{//返回列数
    return self.backArray.count;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{//返回行数
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{//返回每行的内容
    return self.backArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{//选中某行时执行的方法
    self.chooseABankLabel.text = self.backArray[row];
}

/**
 *  提交
 */
- (IBAction)submitClick:(UIButton *)sender {
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
