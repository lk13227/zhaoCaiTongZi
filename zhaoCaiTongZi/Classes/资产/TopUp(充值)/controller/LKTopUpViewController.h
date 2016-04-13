//
//  LKTopUpViewController.h
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/8.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKTopUpViewController : UIViewController
/** 余额 */
@property (strong, nonatomic) IBOutlet UILabel *balanceLabel;
/** 充值textfield */
@property (strong, nonatomic) IBOutlet UITextField *topUpTextField;
/** 验证按钮 */
@property (strong, nonatomic) IBOutlet UIButton *validationBtn;
/** 验证textfield */
@property (strong, nonatomic) IBOutlet UITextField *validationTextField;
/** 充值按钮 */
@property (strong, nonatomic) IBOutlet UIButton *topUpBtn;


@end
