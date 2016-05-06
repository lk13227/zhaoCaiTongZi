//
//  selectViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/5.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "selectViewController.h"

#import <Masonry.h>
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface selectViewController ()

/** 背景view */
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
/** 抢购按钮 */
@property (strong, nonatomic) IBOutlet UIButton *snapBtn;
/** 抢购按钮上的字 */
@property (strong, nonatomic) UILabel *snapLabel;

@end

@implementation selectViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置顶部的一些小东西
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"顶部栏"] forBarMetrics:0];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"精品";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
    
    //设置导航栏标题
    //self.navigationItem.title = @"招财童子";
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
}

- (void)setUpView
{
    self.backgroundView.layer.borderColor = [[UIColor redColor] CGColor];
    self.backgroundView.layer.borderWidth = 0.4;
    self.backgroundView.layer.masksToBounds = YES;
    self.backgroundView.layer.cornerRadius = 5;
    
    //按钮上的字
    self.snapLabel = [[UILabel alloc] init];
    self.snapLabel.font = [UIFont systemFontOfSize:11];
    self.snapLabel.numberOfLines = 2;
    self.snapLabel.textAlignment = NSTextAlignmentCenter;
    self.snapLabel.text = @"立即抢购\n 25/100";
    self.snapLabel.textColor = [UIColor whiteColor];
    [self.snapBtn addSubview:self.snapLabel];
    [self.snapLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.snapBtn);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
}

- (void)setUpData
{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"pager"] = @"";
    params[@"home"] = @"";
    params[@"version"] = VERSION;
    
    //发送请求
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json",nil];
    
    [manager POST:[NSString stringWithFormat:@"%@financinghome.do",testURL] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        LKLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LKLog(@"error ===== %@",error);
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
    
}

/**
 *  抢购按钮响应事件
 */
- (IBAction)snapClick:(UIButton *)sender {
    self.tabBarController.selectedIndex = 1;
}

@end
