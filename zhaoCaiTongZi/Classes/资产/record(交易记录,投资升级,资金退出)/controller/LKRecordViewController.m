//
//  LKRecordViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/12.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKRecordViewController.h"

#import <HMSegmentedControl.h>

@interface LKRecordViewController ()<UIScrollViewDelegate>

/** 分段控制器上的滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 分段控制器 */
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@end

@implementation LKRecordViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    
    [self createUI];
}

- (void)createUI
{
    //上面的分段控制器
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, LKScreenW, 50)];
    self.segmentedControl.sectionTitles = @[@"产品名",@"投资金额",@"预期年化",@"结息周期"];
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
    self.scrollView.contentSize = CGSizeMake(LKScreenW * 4, LKScreenH-114);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, LKScreenW, LKScreenH-114) animated:NO];
    [self.view addSubview:self.scrollView];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
}

@end
