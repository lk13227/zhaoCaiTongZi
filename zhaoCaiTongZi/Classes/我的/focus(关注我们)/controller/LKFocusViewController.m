//
//  LKFocusViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/7.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKFocusViewController.h"

#import "LKMyTableViewCell.h"

@interface LKFocusViewController ()<UITableViewDataSource,UITableViewDelegate>

/** 下面的tableview */
@property (strong, nonatomic) IBOutlet UITableView *focusTableView;
/** 标题数组 */
@property (strong, nonatomic) NSArray *titleArray;
/** 副标题数组 */
@property (strong, nonatomic) NSArray *otherTitleArray;
/** 标题图片数组 */
@property (strong, nonatomic) NSArray *iconImageArray;

@end

@implementation LKFocusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArray = @[@"微信公众号",@"官方微博",@"官方qq群",@"客服邮箱"];
    self.otherTitleArray = @[@"Dragonupziben",@"招财童子",@"232363487",@"lmzb@dragonup.net"];
    self.iconImageArray = @[@"weixin",@"weibo",@"qq",@"youxiang"];
    
    self.navigationItem.title = @"关注我们";
    
    self.focusTableView.scrollEnabled = NO;
    [self.focusTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LKMyTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"mycell"];
    [self.focusTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];//去掉多余的cell
}


#pragma mark -tableView相关
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LKMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    cell.titleLabel.text = self.titleArray[indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:self.iconImageArray[indexPath.row]];
    cell.otherLabel.textColor = [UIColor blackColor];
    cell.otherLabel.text = self.otherTitleArray[indexPath.row];
    
    return cell;
}

@end
