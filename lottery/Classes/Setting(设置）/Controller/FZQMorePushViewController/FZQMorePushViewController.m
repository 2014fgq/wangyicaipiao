//
//  FZQMorePushViewController.m
//  lottery
//
//  Created by IMAC on 16/4/6.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQMorePushViewController.h"

@implementation FZQMorePushViewController

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
    self.navigationItem.title = @"推送和提醒";
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
    settingItem0.subTitle = [self dateStr];
    
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
    settingItem0.title = @"检查新版本";
    settingItem0.subTitle = [self dateStr];
    
    //创建组模型
    FZQGroupItem *group1 = [[FZQGroupItem alloc]init];
    
    //把行模型加入到组模型settingItems数组中
    [group1.items addObjectsFromArray:@[settingItem0]];
    
    //加入到数据组中
    [self.groups addObject:group1];
}
/* 设置第2组数据 */
- (void)setGroup2
{
    //创建行模型
    FZQBaseItem *settingItem0 = [[FZQBaseItem alloc]init];
    settingItem0.title = @"检查新版本";
    settingItem0.subTitle = [self dateStr];
    
    //创建组模型
    FZQGroupItem *group2 = [[FZQGroupItem alloc]init];
    
    //把行模型加入到组模型settingItems数组中
    [group2.items addObjectsFromArray:@[settingItem0]];
    
    //加入到数据组中
    [self.groups addObject:group2];
}

#pragma mark - 获取当前时间
- (NSString *)dateStr
{
    //获取当前时间
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    return [formatter stringFromDate:date];
}
@end
