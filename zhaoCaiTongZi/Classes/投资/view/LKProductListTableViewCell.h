//
//  LKProductListTableViewCell.h
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/11.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKProductListTableViewCell : UITableViewCell
/** 标题 */
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
/** 副标题 */
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
/** 收益百分比 */
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;
/** 结算周期 */
@property (strong, nonatomic) IBOutlet UILabel *cycleLabel;
/** 立即购买按钮 */
@property (strong, nonatomic) IBOutlet UIButton *buyButton;

@end
