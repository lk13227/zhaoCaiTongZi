//
//  AssetsViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/6.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "AssetsViewController.h"

#import "LKMyTableViewCell.h"
#import "LKTopUpViewController.h"
#import "LKWithdrawalViewController.h"
#import "LKRecordViewController.h"
#import "LKInvestmentManagementViewController.h"

@interface AssetsViewController ()<UITableViewDataSource,UITableViewDelegate>

/*********************  UI层  *******************/
/** 资产tableview */
@property (strong, nonatomic) IBOutlet UITableView *assetsTableView;
/** 用户名 */
@property (strong, nonatomic) IBOutlet UILabel *userName;
/** 预期总收益 */
@property (strong, nonatomic) IBOutlet UILabel *expected;
/** 累计收益 */
@property (strong, nonatomic) IBOutlet UILabel *cumulative;
/** 总资产 */
@property (strong, nonatomic) IBOutlet UILabel *total;
/** 账户余额 */
@property (strong, nonatomic) IBOutlet UILabel *balance;
/** 充值 */
@property (strong, nonatomic) IBOutlet UIButton *topUpBtn;
/** 提现 */
@property (strong, nonatomic) IBOutlet UIButton *withdrawalBtn;

/*********************  数据层  *******************/
/** 标题数组 */
@property (strong, nonatomic) NSArray *titleArray;
/** 标题图片数组 */
@property (strong, nonatomic) NSArray *iconImageArray;

@end

@implementation AssetsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    
    self.titleArray = @[@"投资管理",@"交易记录",@"投资升级",@"资金退出"];
    self.iconImageArray = @[@"t1",@"t2",@"t3",@"t4"];
    
    [self.assetsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LKMyTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"mycell"];
    [self.assetsTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];//去掉多余的cell
}

#pragma mark - tableView相关

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LKMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    cell.titleLabel.text = self.titleArray[indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:self.iconImageArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        LKInvestmentManagementViewController *investmentVC = [[LKInvestmentManagementViewController alloc] init];
        investmentVC.navigationItem.title = @"我的投资";
        [self.navigationController pushViewController:investmentVC animated:YES];
    }
    if (indexPath.row == 1) {
        LKRecordViewController *recordVC = [[LKRecordViewController alloc] init];
        recordVC.navigationItem.title = @"交易记录";
        [self.navigationController pushViewController:recordVC animated:YES];
    }
    if (indexPath.row == 2) {
        LKRecordViewController *recordVC = [[LKRecordViewController alloc] init];
        recordVC.navigationItem.title = @"投资升级";
        [self.navigationController pushViewController:recordVC animated:YES];
    }
    if (indexPath.row == 3) {
        LKRecordViewController *recordVC = [[LKRecordViewController alloc] init];
        recordVC.navigationItem.title = @"资金退出";
        [self.navigationController pushViewController:recordVC animated:YES];
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark 充值提现按钮
/**
 *  充值
 */
- (IBAction)topUpClick:(UIButton *)sender {
    LKTopUpViewController *topUpVC = [[LKTopUpViewController alloc] init];
    [self.navigationController pushViewController:topUpVC animated:YES];
}
/**
 *  提现
 */
- (IBAction)withdrawalClick:(UIButton *)sender {
    LKWithdrawalViewController *withdrawalVC = [[LKWithdrawalViewController alloc] init];
    [self.navigationController pushViewController:withdrawalVC animated:YES];
}


@end
