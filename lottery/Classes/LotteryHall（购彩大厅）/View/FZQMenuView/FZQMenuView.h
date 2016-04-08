//
//  FZQMenuView.h
//  lottery
//
//  Created by IMAC on 16/3/29.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZQMenuView : UIView

/** 类创建方法 */
+(instancetype)menuView;

/** 弹出菜单 */
+(void)show;

/** 收回菜单 */
+(void)hide;

/** 菜单在某处消失 */
+(void)hideInPoint:(CGPoint)point;

@end
