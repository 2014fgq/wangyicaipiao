//
//  FZQSwitchView.h
//  addressList
//
//  Created by IMAC on 16/3/14.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZQSwitchView : UIView

/** 文本 */
@property (nonatomic, weak) IBOutlet UILabel * lbl;
/** 开关 */
@property (weak, nonatomic) IBOutlet UISwitch *swt;

/** 类创建方法 */
+(id)switchView;
@end
