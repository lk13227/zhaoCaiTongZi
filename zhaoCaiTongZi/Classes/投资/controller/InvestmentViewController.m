//
//  InvestmentViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/6.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "InvestmentViewController.h"

#import <SDCycleScrollView.h>
#import <HMSegmentedControl.h>

#import "LKProductListTableViewCell.h"
#import "LKDetailsViewController.h"

#define CellID @"productList"

@interface InvestmentViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

/** 分段控制器上的滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 分段控制器 */
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
/** 理财tableview */
@property (strong, nonatomic) UITableView *financialTableView;
/** 基金tableview */
@property (strong, nonatomic) UITableView *fundTableView;

/***********      模型层假数据     **********/
/** 理财标题数据 */
@property (strong, nonatomic) NSArray *financialTitleArray;
/** 基金标题数据 */
@property (strong, nonatomic) NSArray *fundTitleArray;
/** 理财副标题数据 */
@property (strong, nonatomic) NSArray *financialSubtitleArray;
/** 基金副标题数据 */
@property (strong, nonatomic) NSArray *fundSubtitleArray;
/** 理财百分比数据 */
@property (strong, nonatomic) NSArray *financialPercentageArray;
/** 基金百分比数据 */
@property (strong, nonatomic) NSArray *fundPercentageArray;
/** 理财周期数据 */
@property (strong, nonatomic) NSArray *financialCycleArray;
/** 基金周期数据 */
@property (strong, nonatomic) NSArray *fundCycleArray;
@end

@implementation InvestmentViewController

- (void)createData
{
    //理财
    self.financialTitleArray = @[@"季季红",@"六六顺",@"年年盈"];
    self.financialSubtitleArray = @[@"(财富通)",@"(财富通)",@"(财富通)"];
    self.financialPercentageArray = @[@"11.0%",@"12.0%",@"13.0%"];
    self.financialCycleArray = @[@"3个月",@"6个月",@"12个月"];
    //基金
    self.fundTitleArray = @[@"理财宝"];
    self.fundSubtitleArray = @[@"(财富通)"];
    self.fundPercentageArray = @[@"18.0%"];
    self.fundCycleArray = @[@"18个月"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏标题
    self.navigationItem.title = @"产品列表";
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    
    [self createData];
    //创建UI
    [self createUI];
}

/**
 *  创建UI
 */
- (void)createUI
{
    //上面的轮播图
    NSArray *adImageArr = @[@"理财宝.png",@"年年盈.png",@"六六顺.png",@"bn.png"];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, LKScreenW, 120) imageNamesGroup:adImageArr];
    self.automaticallyAdjustsScrollViewInsets = NO;//关闭自动调整scrollerView
    [self.view addSubview:cycleScrollView];
    
    //下面的分段控制器
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 184, LKScreenW, 50)];
    self.segmentedControl.sectionTitles = @[@"定向理财", @"定增基金"];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor whiteColor];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : LKRGBColor(150, 150, 150),
                NSFontAttributeName : [UIFont systemFontOfSize:16]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : LKRGBColor(251, 104, 92),
                NSFontAttributeName : [UIFont systemFontOfSize:16]};
    self.segmentedControl.selectionIndicatorColor = LKRGBColor(253, 165, 161);
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedControl.selectionIndicatorHeight = 3;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    //中间分割线
    self.segmentedControl.verticalDividerEnabled = YES;
    self.segmentedControl.verticalDividerColor = LKRGBColor(220, 220, 220);
    self.segmentedControl.verticalDividerWidth = 1.0f;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(LKScreenW * index, 0, LKScreenW, LKScreenH-234) animated:YES];
    }];
    
    [self.view addSubview:self.segmentedControl];
    
    //分段控制器下面的scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 234, LKScreenW, LKScreenH-234)];
    //self.scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(LKScreenW * 2, LKScreenH-234);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, LKScreenW, LKScreenH-234) animated:NO];
    [self.view addSubview:self.scrollView];
    
    //理财
    self.financialTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LKScreenW, LKScreenH-234) style:UITableViewStylePlain];
    self.financialTableView.delegate = self;
    self.financialTableView.dataSource = self;
    [self.scrollView addSubview:self.financialTableView];
    [self.financialTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LKProductListTableViewCell class]) bundle:nil] forCellReuseIdentifier:CellID];
    
    //基金
    self.fundTableView = [[UITableView alloc] initWithFrame:CGRectMake(LKScreenW, 0, LKScreenW, LKScreenH-234) style:UITableViewStylePlain];
    self.fundTableView.delegate = self;
    self.fundTableView.dataSource = self;
    [self.scrollView addSubview:self.fundTableView];
    [self.fundTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LKProductListTableViewCell class]) bundle:nil] forCellReuseIdentifier:CellID];
    
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
}

#pragma mark - UITableView相关
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == self.financialTableView) {
        UIView *headerView = [[UIView alloc] init];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, LKScreenW, 20)];
        label.text = @"1万起投,投资越多收益越高";
        label.font = [UIFont systemFontOfSize:11];
        [headerView addSubview:label];
        return headerView;
    } else {
        UIView *headerView = [[UIView alloc] init];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, LKScreenW, 20)];
        label.text = @"50万起投,浮动高收益";
        label.font = [UIFont systemFontOfSize:11];
        [headerView addSubview:label];
        return headerView;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.financialTableView) {
        return 3;
    }
    if (tableView == self.fundTableView) {
        return 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.financialTableView) {
        LKProductListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        
        cell.titleLabel.text = self.financialTitleArray[indexPath.row];
        cell.subtitleLabel.text = self.financialSubtitleArray[indexPath.row];
        cell.percentageLabel.text = self.financialPercentageArray[indexPath.row];
        cell.cycleLabel.text = self.financialCycleArray[indexPath.row];
        
        return cell;
    } else {
        LKProductListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        
        cell.titleLabel.text = self.fundTitleArray[indexPath.row];
        cell.subtitleLabel.text = self.fundSubtitleArray[indexPath.row];
        cell.percentageLabel.text = self.fundPercentageArray[indexPath.row];
        cell.cycleLabel.text = self.fundCycleArray[indexPath.row];
        
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LKDetailsViewController *detailsVC = [[LKDetailsViewController alloc] init];
    detailsVC.navigationItem.title = @"详情";
    [self.navigationController pushViewController:detailsVC animated:YES];
}

@end
