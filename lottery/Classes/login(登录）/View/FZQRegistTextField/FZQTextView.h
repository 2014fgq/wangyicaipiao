//
//  FZQRegistView.h
//  registInterface
//
//  Created by IMAC on 16/3/13.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZQTextView : UIView<UITextFieldDelegate>

/** 注册项目文本 */
@property (nonatomic, weak) UILabel * label;

/** 输入文本框 */
@property (nonatomic, weak) UITextField * textField;


/** 类创建方法 */
+(id)TextView;

/** 初始化控件 */
-(void)setUp;

@end
