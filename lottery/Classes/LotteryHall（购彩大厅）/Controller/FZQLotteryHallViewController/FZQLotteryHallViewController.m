//
//  FZQHallViewController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryHallViewController.h"

#import "FZQHudView.h"

#import "FZQMenuView.h"

@interface FZQLotteryHallViewController ()

@end

@implementation FZQLotteryHallViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    /** 初始化导航条 */
    [self setUpNav];
    
    
}

/** 初始化导航条 */
-(void)setUpNav
{   
    /** 初始化导航条 */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageNamed:@"CS50_activity_image"] style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
    
}

#pragma mark - hud
/* 活动 */
- (void)activity
{
    /** 弹出蒙板 */
    [FZQHudView show];
    
    /** 弹出菜单 */
    [FZQMenuView show];
}


@end
