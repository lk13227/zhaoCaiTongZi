//
//  LKInvestmentManagementViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/19.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKInvestmentManagementViewController.h"

#import "LKInvestmentTableViewCell.h"

#import <HMSegmentedControl.h>
#import <Masonry.h>

#define CellID @"investment"

@interface LKInvestmentManagementViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

/** 分段控制器上的滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 分段控制器 */
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
/** 财富通tableview */
@property (strong, nonatomic) UITableView *wealthThroughTableView;
/** 财富通view */
@property (strong, nonatomic) UIView *wealthThroughView;
/** 理财宝tableview */
@property (strong, nonatomic) UITableView *wealthTreasureTableView;
/** 理财宝view */
@property (strong, nonatomic) UIView *wealthTreasureView;

/** data */
@property (strong, nonatomic) NSArray *dataArr;

@end

@implementation LKInvestmentManagementViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //显示导航栏
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    
    self.dataArr = @[@"累计收益",@"累计赎回",@"投资记录"];
    
    //创建UI
    [self createUI];
}


/**
 *  创建UI
 */
- (void)createUI
{
    //分段控制器
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, LKScreenW, 50)];
    self.segmentedControl.sectionTitles = @[@"财富通", @"理财宝"];
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
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(LKScreenW * index, 0, LKScreenW, LKScreenH-114) animated:YES];
    }];
    
    [self.view addSubview:self.segmentedControl];
    
    //分段控制器下面的scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 114, LKScreenW, LKScreenH-114)];
    //self.scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(LKScreenW * 2, LKScreenH-114);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, LKScreenW, LKScreenH-114) animated:NO];
    [self.view addSubview:self.scrollView];
    
    //财富通
    [self wealthThroughUI];
   
    //理财宝
    [self wealthTreasureUI];
    
}

/**
 *  财富通UI
 */
- (void)wealthThroughUI
{
    //上面的view
    self.wealthThroughView = [[UIView alloc] init];
    self.wealthThroughView.backgroundColor = [UIColor redColor];
    self.wealthThroughView.frame = CGRectMake(0, 0, LKScreenW, 150);
    [self.scrollView addSubview:self.wealthThroughView];
    
    UILabel *expectLabel = [[UILabel alloc] init];
    expectLabel.text = @"预计收益(元)";
    expectLabel.textColor = [UIColor whiteColor];
    expectLabel.textAlignment = NSTextAlignmentCenter;
    [self.wealthThroughView addSubview:expectLabel];
    [expectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.wealthThroughView.mas_top).offset(10);
        make.height.offset(20);
        make.width.offset(120);
        make.centerX.mas_equalTo(self.wealthThroughView.mas_centerX);
    }];
    
    UILabel *expectNumber = [[UILabel alloc] init];
    expectNumber.text = @"0.00";
    expectNumber.textColor = [UIColor whiteColor];
    expectNumber.font = [UIFont systemFontOfSize:40];
    expectNumber.textAlignment = NSTextAlignmentCenter;
    [self.wealthThroughView addSubview:expectNumber];
    [expectNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(expectLabel.mas_bottom).offset(10);
        make.height.offset(40);
        make.width.offset(120);
        make.centerX.mas_equalTo(self.wealthThroughView.mas_centerX);
    }];
    
    UILabel *castLabel = [[UILabel alloc] init];
    castLabel.text = @"在投金额(元)";
    castLabel.textColor = [UIColor whiteColor];
    castLabel.textAlignment = NSTextAlignmentCenter;
    [self.wealthThroughView addSubview:castLabel];
    [castLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(expectNumber.mas_bottom).offset(10);
        make.height.offset(20);
        make.width.offset(120);
        make.centerX.mas_equalTo(self.wealthThroughView.mas_centerX);
    }];
    
    UILabel *castNumber = [[UILabel alloc] init];
    castNumber.text = @"0.00";
    castNumber.textColor = [UIColor whiteColor];
    castNumber.textAlignment = NSTextAlignmentCenter;
    castNumber.font = [UIFont systemFontOfSize:20];
    [self.wealthThroughView addSubview:castNumber];
    [castNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(castLabel.mas_bottom).offset(10);
        make.height.offset(20);
        make.width.offset(120);
        make.centerX.mas_equalTo(self.wealthThroughView.mas_centerX);
    }];
    
    //下面tableview
    self.wealthThroughTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, LKScreenW, LKScreenH-214) style:UITableViewStylePlain];
    self.wealthThroughTableView.delegate = self;
    self.wealthThroughTableView.dataSource = self;
    [self.scrollView addSubview:self.wealthThroughTableView];
    [self.wealthThroughTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LKInvestmentTableViewCell class]) bundle:nil] forCellReuseIdentifier:CellID];
    [self.wealthThroughTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];//去掉多余的cell
}

/**
 *  理财宝UI
 */
- (void)wealthTreasureUI
{
    //上面的view
    self.wealthTreasureView = [[UIView alloc] init];
    self.wealthTreasureView.backgroundColor = [UIColor redColor];
    self.wealthTreasureView.frame = CGRectMake(LKScreenW, 0, LKScreenW, 150);
    [self.scrollView addSubview:self.wealthTreasureView];
    
    UILabel *expectLabel = [[UILabel alloc] init];
    expectLabel.text = @"预计收益(元)";
    expectLabel.textColor = [UIColor whiteColor];
    expectLabel.textAlignment = NSTextAlignmentCenter;
    [self.wealthTreasureView addSubview:expectLabel];
    [expectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.wealthTreasureView.mas_top).offset(10);
        make.height.offset(20);
        make.width.offset(120);
        make.centerX.mas_equalTo(self.wealthTreasureView.mas_centerX);
    }];
    
    UILabel *expectNumber = [[UILabel alloc] init];
    expectNumber.text = @"0.00";
    expectNumber.textColor = [UIColor whiteColor];
    expectNumber.font = [UIFont systemFontOfSize:40];
    expectNumber.textAlignment = NSTextAlignmentCenter;
    [self.wealthTreasureView addSubview:expectNumber];
    [expectNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(expectLabel.mas_bottom).offset(10);
        make.height.offset(40);
        make.width.offset(120);
        make.centerX.mas_equalTo(self.wealthTreasureView.mas_centerX);
    }];
    
    UILabel *castLabel = [[UILabel alloc] init];
    castLabel.text = @"在投金额(元)";
    castLabel.textColor = [UIColor whiteColor];
    castLabel.textAlignment = NSTextAlignmentCenter;
    [self.wealthTreasureView addSubview:castLabel];
    [castLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(expectNumber.mas_bottom).offset(10);
        make.height.offset(20);
        make.width.offset(120);
        make.centerX.mas_equalTo(self.wealthTreasureView.mas_centerX);
    }];
    
    UILabel *castNumber = [[UILabel alloc] init];
    castNumber.text = @"0.00";
    castNumber.textColor = [UIColor whiteColor];
    castNumber.textAlignment = NSTextAlignmentCenter;
    castNumber.font = [UIFont systemFontOfSize:20];
    [self.wealthTreasureView addSubview:castNumber];
    [castNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(castLabel.mas_bottom).offset(10);
        make.height.offset(20);
        make.width.offset(120);
        make.centerX.mas_equalTo(self.wealthTreasureView.mas_centerX);
    }];
    
    
    //下面的tableview
    self.wealthTreasureTableView = [[UITableView alloc] initWithFrame:CGRectMake(LKScreenW, 150, LKScreenW, LKScreenH-214) style:UITableViewStylePlain];
    self.wealthTreasureTableView.delegate = self;
    self.wealthTreasureTableView.dataSource = self;
    [self.scrollView addSubview:self.wealthTreasureTableView];
    [self.wealthTreasureTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LKInvestmentTableViewCell class]) bundle:nil] forCellReuseIdentifier:CellID];
    [self.wealthTreasureTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];//去掉多余的cell
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
}

#pragma mark - UITableView相关
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 80;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.wealthThroughTableView) {
        LKInvestmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        
        cell.titleLabel.text = self.dataArr[indexPath.row];
        if (indexPath.row == 1 || indexPath.row == 0) {
            cell.jiantouImageView.hidden = YES;
            cell.subTitleLabel.text = @"0.00";
        }
        
        return cell;
    } else {
        LKInvestmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        
        cell.titleLabel.text = self.dataArr[indexPath.row];
        if (indexPath.row == 1 || indexPath.row == 0) {
            cell.jiantouImageView.hidden = YES;
            cell.subTitleLabel.text = @"0.00";
        }
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
