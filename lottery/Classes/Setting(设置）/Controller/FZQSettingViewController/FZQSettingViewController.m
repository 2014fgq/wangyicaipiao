//
//  FZQSettingViewController.m
//  lottery
//
//  Created by IMAC on 16/4/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQSettingViewController.h"

#import "FZQRedeemCodeViewController.h"

#import "FZQMorePushViewController.h"

@interface FZQSettingViewController ()

@end

@implementation FZQSettingViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 初始化导航栏 */
    [self setUpNav];
}

/** 初始化导航栏 */
-(void)setUpNav
{   
    /** 初始化导航栏 */
    self.navigationItem.title = @"设置";
    
    //右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStyleDone target:self action:@selector(settingToQuestion)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

#pragma mark - skip
/* 常见问题 */
- (void)settingToQuestion
{
    //跳转界面
}

#pragma mark - setGroupItem
/* 设置所有数据 */
- (void)setAllGroups
{
    //加载第一组数据
    [self setGroup0];
    
    //加载第二组数据
    [self setGroup1];
    
    //加载第三组数据
    [self setGroup2];
}

/* 设置第0组数据 */
- (void)setGroup0
{
    NSArray *_array = @[@{@"class":[FZQArrowItem class], @"icon":[UIImage imageNamed:@"RedeemCode"],
                          @"title":@"使用兑换码", @"skipController":[FZQRedeemCodeViewController class]},
                        ];
    
    //加入到数据组中
    [self.groups addObject:[self setupChildViewWithArray:_array]];
}
/* 设置第1组数据 */
- (void)setGroup1
{
    NSArray *_array = @[@{@"class":[FZQArrowItem class], @"icon":[UIImage imageNamed:@"MorePush"],
                          @"title":@"推送和提醒", @"skipController":[FZQMorePushViewController class]},
                        @{@"class":[FZQSwitchItem class], @"icon":[UIImage imageNamed:@"handShake"],
                          @"title":@"使用摇一摇机选"},
                        @{@"class":[FZQSwitchItem class], @"icon":[UIImage imageNamed:@"sound_Effect"],
                          @"title":@"声音效果"},
                        @{@"class":[FZQSwitchItem class], @"icon":[UIImage imageNamed:@"More_LotteryRecommend"],
                          @"title":@"购彩小助手"},
                        ];
    
    //加入到数据组中
    [self.groups addObject:[self setupChildViewWithArray:_array]];
}
/* 设置第2组数据 */
- (void)setGroup2
{
    NSArray *_array = @[@{@"class":[FZQArrowItem class], @"icon":[UIImage imageNamed:@"MoreUpdate"],
                          @"title":@"检查新版本", @"skipController":[FZQMorePushViewController class]},
                        @{@"class":[FZQArrowItem class], @"icon":[UIImage imageNamed:@"MoreShare"],
                          @"title":@"分享",      @"skipController":[FZQMorePushViewController class]},
                        @{@"class":[FZQArrowItem class], @"icon":[UIImage imageNamed:@"MoreNetease"],
                          @"title":@"产品推荐",   @"skipController":[FZQMorePushViewController class]},
                        @{@"class":[FZQArrowItem class], @"icon":[UIImage imageNamed:@"MoreAbout"],
                          @"title":@"关于",      @"skipController":[FZQMorePushViewController class]},
                        ];
    //加入到数据组中
    [self.groups addObject:[self setupChildViewWithArray:_array]];
}

@end
