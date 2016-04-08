//
//  FZQRedeemCodeViewController.m
//  lottery
//
//  Created by IMAC on 16/4/6.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQRedeemCodeViewController.h"

@implementation FZQRedeemCodeViewController

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
    self.navigationItem.title = @"使用兑换码";
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
    FZQBaseItem *settingItem0 = [[FZQBaseItem alloc]init];
    
    //设置行模型数据
    settingItem0.title = @"使用兑换码";
    
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
    FZQBaseItem *settingItem0 = [[FZQBaseItem alloc]init];
    settingItem0.title = @"推送和提醒";
    
    FZQBaseItem *settingItem1 = [[FZQBaseItem alloc]init];
    settingItem1.title = @"使用摇一摇机选";
    
    FZQBaseItem *settingItem2 = [[FZQBaseItem alloc]init];
    settingItem2.title = @"声音效果";
    
    FZQBaseItem *settingItem3 = [[FZQBaseItem alloc]init];
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
    FZQBaseItem *settingItem0 = [[FZQBaseItem alloc]init];
    settingItem0.title = @"检查新版本";
    
    FZQBaseItem *settingItem1 = [[FZQBaseItem alloc]init];
    settingItem1.title = @"分享";
    
    FZQBaseItem *settingItem2 = [[FZQBaseItem alloc]init];
    settingItem2.title = @"产品推荐";
    
    FZQBaseItem *settingItem3 = [[FZQBaseItem alloc]init];
    settingItem3.title = @"检查新版本";
    
    //创建组模型
    FZQGroupItem *group2 = [[FZQGroupItem alloc]init];
    
    //把行模型加入到组模型settingItems数组中
    [group2.items addObjectsFromArray:@[settingItem0,settingItem1,settingItem2,settingItem3]];
    
    //加入到数据组中
    [self.groups addObject:group2];
}

@end
