//
//  FZQHudView.m
//  lottery
//
//  Created by IMAC on 16/3/29.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQHudView.h"


@implementation FZQHudView


/** 弹出蒙板 */
+(void)show
{
    //生成蒙板
    FZQHudView *hudView = [[FZQHudView alloc]initWithFrame:SCREEN.bounds];
    //设置颜色和透明度
    hudView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    //加入主窗口
    [KEYWINDOW addSubview:hudView];
}

/** 收回蒙板 */
+(void)hide
{
    for (UIView *childView in KEYWINDOW.subviews) {
        
        if ([childView isKindOfClass:self] == YES){
            //如果不是自定义的tabBar,将所有系统按钮移除
            [childView removeFromSuperview];
        }
    }
}
@end
