//
//  LKMyAccountViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/7.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKMyAccountViewController.h"

#import "LKMyTableViewCell.h"
#import "LKModifyTheCellPhoneNumberViewController.h"
#import "LKChangeThePasswordViewController.h"
#import "LKTheIdentityAuthenticationViewController.h"

@interface LKMyAccountViewController ()

/** 标题数组 */
@property (strong, nonatomic) NSArray *titleArray;
/** 标题图片数组 */
@property (strong, nonatomic) NSArray *iconImageArray;

@end

@implementation LKMyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    self.navigationController.title = @"我的账户";
    
    self.titleArray = @[@[@"用户名",@"用户信息"],@[@"登录密码"],@[@"真实姓名",@"身份证号",@"身份认证"],@[@"绑定手机"]];
    self.iconImageArray = @[@[@"yt1",@"yt2"],@[@"yt3"],@[@"yt4",@"yt5",@"yt6"],@[@"yt7"]];
    
    //注册tableviewCell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LKMyTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"mycell"];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];//去掉多余的cell
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3) {
        LKModifyTheCellPhoneNumberViewController *modifyTheCellPhoneNumberVC = [[LKModifyTheCellPhoneNumberViewController alloc] init];
        modifyTheCellPhoneNumberVC.navigationItem.title = @"修改绑定手机号";
        [self.navigationController pushViewController:modifyTheCellPhoneNumberVC animated:YES];
    }
    if (indexPath.section == 1) {
        LKChangeThePasswordViewController *changeThePasswordVC = [[LKChangeThePasswordViewController alloc] init];
        changeThePasswordVC.navigationItem.title = @"修改登录密码";
        [self.navigationController pushViewController:changeThePasswordVC animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 2) {
        LKTheIdentityAuthenticationViewController *theIdentityAuthenticationVC = [[LKTheIdentityAuthenticationViewController alloc] init];
        theIdentityAuthenticationVC.navigationItem.title = @"身份认证";
        [self.navigationController pushViewController:theIdentityAuthenticationVC animated:YES];
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 3;
    } else if (section == 3) {
        return 1;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LKMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    cell.titleLabel.text = self.titleArray[indexPath.section][indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:self.iconImageArray[indexPath.section][indexPath.row]];
    if ( (indexPath.section == 0 && indexPath.row == 0) || (indexPath.section == 2 && indexPath.row == 0) ) {
        cell.arrowImage.image = nil;
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


@end
