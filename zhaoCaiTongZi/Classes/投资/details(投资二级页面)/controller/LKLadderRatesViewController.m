//
//  LKLadderRatesViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/13.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKLadderRatesViewController.h"

#import <AFNetworking.h>
#import <SVProgressHUD.h>

#import "progress.h"
#import "progress1.h"
#import "progress2.h"
#import "progress3.h"
#import "progress4.h"
#import "progress5.h"

@interface LKLadderRatesViewController ()

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view10;
@property (strong, nonatomic) IBOutlet UIView *view30;
@property (strong, nonatomic) IBOutlet UIView *view50;
@property (strong, nonatomic) IBOutlet UIView *view100;
@property (strong, nonatomic) IBOutlet UIView *view300;

@end


@implementation LKLadderRatesViewController

- (void)viewWillAppear:(BOOL)animated
{
//    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil]];
//
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    
    [self createUI];
}


- (void)createUI
{
    //1万进度条
    progress *progress_0 = [[progress alloc] initWithFrame:CGRectMake(90, 10, 80, 20)];
    [self.view1 addSubview:progress_0];
    UILabel *label0 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 4.68, 0, 30, 20)];
    label0.text = @"10%";
    label0.textColor = [UIColor whiteColor];
    label0.font = [UIFont systemFontOfSize:15];
    [progress_0 addSubview:label0];
    
    //10万进度条
    progress1 *progress_1 = [[progress1 alloc] initWithFrame:CGRectMake(90, 10, 80, 20)];
    [self.view10 addSubview:progress_1];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 3.75, 0, 30, 20)];
    label1.text = @"11%";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:15];
    [progress_1 addSubview:label1];
    
    //30万进度条
    progress2 *progress_2 = [[progress2 alloc] initWithFrame:CGRectMake(90, 10, 80, 20)];
    [self.view30 addSubview:progress_2];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 3.125, 0, 30, 20)];
    label2.text = @"12%";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:15];
    [progress_2 addSubview:label2];
    
    //50万进度条
    progress3 *progress_3 = [[progress3 alloc] initWithFrame:CGRectMake(90, 10, 80, 20)];
    [self.view50 addSubview:progress_3];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2.678, 0, 30, 20)];
    label3.text = @"13%";
    label3.textColor = [UIColor whiteColor];
    label3.font = [UIFont systemFontOfSize:15];
    [progress_3 addSubview:label3];
    
    //100万进度条
    progress4 *progress_4 = [[progress4 alloc] initWithFrame:CGRectMake(90, 10, 80, 20)];
    [self.view100 addSubview:progress_4];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2.34, 0, 30, 20)];
    label4.text = @"14%";
    label4.textColor = [UIColor whiteColor];
    label4.font = [UIFont systemFontOfSize:15];
    [progress_4 addSubview:label4];
    
    //300万进度条
    progress5 *progress_5 = [[progress5 alloc] initWithFrame:CGRectMake(90, 10, 80, 20)];
    [self.view300 addSubview:progress_5];
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2.08, 0, 30, 20)];
    label5.text = @"15%";
    label5.textColor = [UIColor whiteColor];
    label5.font = [UIFont systemFontOfSize:15];
    [progress_5 addSubview:label5];
    
}

- (void)setUpData
{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"pid"] = @"";
    params[@"version"] = VERSION;
    
    //发送请求
    [[AFHTTPSessionManager manager] POST:[NSString stringWithFormat:@"%@preincomerate.do",testURL] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        LKLog(@"------%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LKLog(@"error ===== %@",error);
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
}

@end
