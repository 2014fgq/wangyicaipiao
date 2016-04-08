//
//  FZQGuide.m
//  lottery
//
//  Created by IMAC on 16/4/1.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQGuideTool.h"

#import "FZQTabBarController.h"

#import "FZQNewFeatureViewController.h"

#import "FZQSaveTool.h"

#define FZQVersion (@"version")

@interface FZQGuideTool ()

/** app旧版本 */
@property (nonatomic, assign) CGFloat oldVersion;

@end

@implementation FZQGuideTool

#pragma mark - lacy load
-(CGFloat)OLDVersion
{
    if (!_oldVersion) {
        
        //从app保存文件中获取已有版本号
//        _oldVersion;
    }
    return _oldVersion;
}

/** 选择控制器 */
+ (UIViewController *)chooseRootController
{
    //定义控制器
    UIViewController *vc;
    
    //获取info
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    
    //获取当前app版本
    NSString *newVersion = infoDict[@"CFBundleShortVersionString"];

    //判断当前版本与已有版本是否一致
    if([newVersion isEqualToString:[FZQSaveTool objectForKey:FZQVersion]]){
    
        //一致设置窗口的根控制器为主框架控制器
        vc = [[FZQTabBarController alloc] init];
    }else{
        // 不一致，设置窗口的根控制器为新特性控制器
        vc = [[FZQNewFeatureViewController alloc]init];
        
        //保存新版本号
        [FZQSaveTool setObject:newVersion forKey:FZQVersion];
    }    
    //返回控制器
    return vc;
}

@end
