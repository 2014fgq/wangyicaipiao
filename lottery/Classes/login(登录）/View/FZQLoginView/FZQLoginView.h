//
//  FZQLoginView.h
//  addressList
//
//  Created by IMAC on 16/3/14.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQTextView.h"
#import "FZQSwitchView.h"

@interface FZQLoginView : UIView


/** 登录按钮 */
@property (nonatomic, weak) UIButton * loginBtn;
/** 账号栏 */
@property (nonatomic, weak) FZQTextView * accountTextView;
/** 密码栏 */
@property (nonatomic, weak) FZQTextView * pwdTextView;
/** 保存密码开关 */
@property (nonatomic, weak) FZQSwitchView * pwdSwith;
///** 自动登录开关 */
@property (nonatomic, weak) FZQSwitchView * loginSwith;

/** 用户输入判断按钮状态 */
-(void)keyin;

@end
