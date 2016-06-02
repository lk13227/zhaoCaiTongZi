//
//  MyViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/6.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "MyViewController.h"

#import "LKMyTableViewCell.h"
#import "LKMyAccountViewController.h"
#import "LKFocusViewController.h"
#import "LKAboutViewController.h"
#import "LKHelpViewController.h"
#import "LKLoginViewController.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
/** 标题数组 */
@property (strong, nonatomic) NSArray *titleArray;
/** 标题图片数组 */
@property (strong, nonatomic) NSArray *titleImageArray;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏标题
    self.navigationItem.title = @"更多";
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    
    self.titleArray = @[@[@"我的账户"],@[@"了解童子"],@[@"帮助中心",@"关注我们"],@[@"风控模式"]];
    self.titleImageArray = @[@[@"ct1"],@[@"ct2"],@[@"ct3",@"ct4"],@[@"ct1"]];
    
    //注册tableviewCell
    self.myTableView.scrollEnabled = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LKMyTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"mycell"];
}

#pragma mark tableView代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //我的账户
    if (indexPath.section == 0 && indexPath.row == 0) {
        LKMyAccountViewController *myAccountVC = [[LKMyAccountViewController alloc] init];
        [self.navigationController pushViewController:myAccountVC animated:YES];
    }
    //了解童子
    if (indexPath.section == 1 && indexPath.row == 0) {
        LKAboutViewController *aboutVC = [[LKAboutViewController alloc] init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }
    //帮助中心
    if (indexPath.section == 2 && indexPath.row == 0) {
        LKHelpViewController *helpVC = [[LKHelpViewController alloc] init];
        [self.navigationController pushViewController:helpVC animated:YES];
    }
    //关注我们
    if (indexPath.section == 2 && indexPath.row == 1) {
        LKFocusViewController *focusVC = [[LKFocusViewController alloc] init];
        [self.navigationController pushViewController:focusVC animated:YES];
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 2;
    } else if (section == 3) {
        return 1;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LKMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    cell.titleLabel.text = self.titleArray[indexPath.section][indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:self.titleImageArray[indexPath.section][indexPath.row]];
    if (indexPath.section == 1 && indexPath.row == 0) {
        cell.otherLabel.text = @"珑门资本旗下";
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView  alloc] init];
    view.backgroundColor = LKRGBColor(234, 234, 234);
    view.frame = CGRectMake(0, 0, LKScreenW, LKScreenH);
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

#pragma mark 登录按钮
- (IBAction)loginButton:(UIButton *)sender {
    LKLoginViewController *loginVC = [[LKLoginViewController alloc] init];
    
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
