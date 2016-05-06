//
//  LKProductDetailsViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/19.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKProductDetailsViewController.h"

#import "LKBuyViewController.h"

#import <Masonry.h>
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface LKProductDetailsViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation LKProductDetailsViewController


- (void)viewWillAppear:(BOOL)animated
{
    //set NavigationBar 背景颜色&title 颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = LKGlobalBg;
    
    [self createUI];
}

- (void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.contentSize = CGSizeMake(LKScreenW, 1400);
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(64);
        make.width.offset(LKScreenW);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
    }];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"产品详情(财富通)"]];
    imageView.frame = CGRectMake(0, 0, LKScreenW, 1400);
    [self.scrollView addSubview:imageView];
}

- (void)setUpData
{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"pid"] = @"";
    params[@"version"] = VERSION;
    
    //发送请求
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json",nil];
    
    [manager POST:[NSString stringWithFormat:@"%@financingproddetails.do",testURL] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        LKLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LKLog(@"error ===== %@",error);
        [SVProgressHUD showErrorWithStatus:@"失败"];
    }];

}

/**
 *  购买按钮
 */
- (IBAction)buyClick:(UIButton *)sender {
    LKBuyViewController *buyVC = [[LKBuyViewController alloc] init];
    
    [self.navigationController pushViewController:buyVC animated:YES];
}

@end
