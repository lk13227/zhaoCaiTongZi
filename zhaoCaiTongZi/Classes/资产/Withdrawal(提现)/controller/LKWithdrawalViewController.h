//
//  LKWithdrawalViewController.h
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/8.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKWithdrawalViewController : UIViewController
/** 可提现余额 */
@property (strong, nonatomic) IBOutlet UILabel *balanceLabel;
/** 提现金额textfield */
@property (strong, nonatomic) IBOutlet UITextField *withdrawalTextField;
/** 验证按钮 */
@property (strong, nonatomic) IBOutlet UIButton *validationBtn;
/** 验证textfield */
@property (strong, nonatomic) IBOutlet UITextField *validationTextField;
/** 提现按钮 */
@property (strong, nonatomic) IBOutlet UIButton *withdrawalBtn;
@end
