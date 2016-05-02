//
//  FZQArenaNavController.m
//  lottery
//
//  Created by IMAC on 16/3/29.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaNavController.h"

@interface FZQArenaNavController ()

@end

@implementation FZQArenaNavController

/** 初始化类时统一对导航控制器设置 */
+(void)initialize
{
    // 当前类初始化的时候才会调用,子类调用时不初始化
    if (self == [FZQArenaNavController class]) {
        
        //获取当前类下面所有导航条
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
        //设置背景图片--经过拉伸保护的图片
        [navBar setBackgroundImage:[UIImage stretchableImageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    }
}


@end
