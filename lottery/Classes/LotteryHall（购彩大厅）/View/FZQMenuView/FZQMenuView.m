//
//  FZQMenuView.m
//  lottery
//
//  Created by IMAC on 16/3/29.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQMenuView.h"

#import "FZQHudView.h"

@implementation FZQMenuView

/** 类创建方法 */
+(instancetype)menuView
{
    //加载xib
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

/** 弹出菜单 */
+(void)show
{
    //生成对象
    FZQMenuView *menuView = [self menuView];
    
    //设置位置
    menuView.center = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5);
    
    //加入到主窗口
    [KEYWINDOW addSubview:menuView];
    
}

/** 菜单在某处消失 */
+(void)hideInPoint:(CGPoint)point
{
    for (UIView *childView in KEYWINDOW.subviews) {
        
        if ([childView isKindOfClass:self] == YES){
           
            //做位移动画
            [UIView animateWithDuration:.5 animations:^{
                
            //设置位移
            
            childView.center = point;
            childView.transform = CGAffineTransformScale(childView.transform, 0.01, 0.01);
            
            }completion:^(BOOL finished) {
            //如果不是自定义的tabBar,将所有系统按钮移除
            [childView removeFromSuperview];
                    
            /** 收回蒙板 */
            [FZQHudView hide];
            }];
        }
    }
}

/** 收回菜单 */
+(void)hide
{
    [self hideInPoint:CGPointMake(50, 50)];
}

/** 收回菜单和蒙板 */
- (IBAction)close {
    
    /** 收回菜单 */
    [[self class] hide];
}

@end
