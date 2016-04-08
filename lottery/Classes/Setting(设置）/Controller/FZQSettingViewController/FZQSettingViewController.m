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
    //创建行模型
    FZQArrowItem *settingItem0 = [[FZQArrowItem alloc]init];
    
    //设置行模型数据
    settingItem0.icon = [UIImage imageNamed:@"RedeemCode"];
    settingItem0.title = @"使用兑换码";
    settingItem0.skipController = [FZQRedeemCodeViewController class];
    
    //创建组模型
    FZQGroupItem *group0 = [[FZQGroupItem alloc]init];

    //把行模型加入到组模型settingItems数组中
    [group0.items addObject:settingItem0];
    
    //加入到数据组中
    [self.groups addObject:group0];
}
/* 设置第1组数据 */
- (void)setGroup1
{
    //创建行模型
    FZQArrowItem *settingItem0 = [[FZQArrowItem alloc]init];
    settingItem0.icon = [UIImage imageNamed:@"MorePush"];
    settingItem0.title = @"推送和提醒";
    settingItem0.skipController = [FZQMorePushViewController class];
    
    
    FZQBaseItem *settingItem1 = [[FZQSwitchItem alloc]init];
    settingItem1.icon = [UIImage imageNamed:@"handShake"];
    settingItem1.title = @"使用摇一摇机选";
    
    FZQBaseItem *settingItem2 = [[FZQSwitchItem alloc]init];
    settingItem2.icon = [UIImage imageNamed:@"sound_Effect"];
    settingItem2.title = @"声音效果";
    
    FZQBaseItem *settingItem3 = [[FZQSwitchItem alloc]init];
    settingItem3.icon = [UIImage imageNamed:@"More_LotteryRecommend"];
    settingItem3.title = @"购彩小助手";
        
    //创建组模型
    FZQGroupItem *group1 = [[FZQGroupItem alloc]init];
    
    //把行模型加入到组模型settingItems数组中
    [group1.items addObjectsFromArray:@[settingItem0,settingItem1,settingItem2,settingItem3]];
    
    //加入到数据组中
    [self.groups addObject:group1];
}
/* 设置第2组数据 */
- (void)setGroup2
{
    //创建行模型
    FZQArrowItem *settingItem0 = [[FZQArrowItem alloc]init];
    settingItem0.icon = [UIImage imageNamed:@"MoreUpdate"];
    settingItem0.title = @"检查新版本";
    settingItem0.skipController = [FZQMorePushViewController class];
    
    FZQArrowItem *settingItem1 = [[FZQArrowItem alloc]init];
    settingItem1.icon = [UIImage imageNamed:@"MoreShare"];
    settingItem1.title = @"分享";
    settingItem0.skipController = [FZQMorePushViewController class];
    
    FZQArrowItem *settingItem2 = [[FZQArrowItem alloc]init];
    settingItem2.icon = [UIImage imageNamed:@"MoreNetease"];
    settingItem2.title = @"产品推荐";
    settingItem0.skipController = [FZQMorePushViewController class];
    
    FZQArrowItem *settingItem3 = [[FZQArrowItem alloc]init];
    settingItem3.icon = [UIImage imageNamed:@"MoreAbout"];
    settingItem3.title = @"关于";
    settingItem0.skipController = [FZQMorePushViewController class];
    
    //创建组模型
    FZQGroupItem *group2 = [[FZQGroupItem alloc]init];
    
    //把行模型加入到组模型settingItems数组中
    [group2.items addObjectsFromArray:@[settingItem0,settingItem1,settingItem2,settingItem3]];
    
    //加入到数据组中
    [self.groups addObject:group2];
}

@end
