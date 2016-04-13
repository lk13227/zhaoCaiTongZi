//
//  LKMyTableViewCell.h
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/6.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKMyTableViewCell : UITableViewCell

/** 标题图片 */
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
/** 标题 */
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
/** 右边说明 */
@property (strong, nonatomic) IBOutlet UILabel *otherLabel;
/** 箭头图片 */
@property (strong, nonatomic) IBOutlet UIImageView *arrowImage;
/** 分隔符 */
@property (strong, nonatomic) IBOutlet UIView *separatorView;

@end
