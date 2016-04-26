//
//  FZQHistoryPushTableViewController.m
//  lottery
//
//  Created by IMAC on 16/4/26.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQHisSettingTableViewController.h"

@interface FZQHisSettingTableViewController ()

@end

@implementation FZQHisSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 初始化导航栏 */
    [self setUpNav];
    [self initSubView];
}

/** 初始化导航栏 */
-(void)setUpNav
{
    /** 初始化导航栏 */
    self.navigationItem.title = @"开奖推送设置";
}

- (void)initSubView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    label.text = @"打开设置即可可在开奖后立即收到推送消息，获知开奖号码";
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    [view addSubview:label];
    
    self.tableView.tableHeaderView = view;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* 设置所有数据 */
- (void)setAllGroups
{
    //加载第一组数据
    [self setGroup0];
}

- (void)setGroup0
{
    NSArray *_array = @[
                        @{@"class":[FZQSwitchItem class],@"title":@"双色球", @"subTitle":@"每周二，四，日开奖"},
                        @{@"class":[FZQSwitchItem class],@"title":@"大乐透", @"subTitle":@"每周一，三，六开奖"},
                        @{@"class":[FZQSwitchItem class],@"title":@"3D", @"subTitle":@"每天开奖 包括试机号提醒"},
                        @{@"class":[FZQSwitchItem class],@"title":@"七乐彩", @"subTitle":@"每周一，三，五开奖"},
                        @{@"class":[FZQSwitchItem class],@"title":@"七星彩", @"subTitle":@"每周二，五，日开奖"},
                        @{@"class":[FZQSwitchItem class],@"title":@"排列3", @"subTitle":@"每天开奖"},
                        @{@"class":[FZQSwitchItem class],@"title":@"排列5", @"subTitle":@"每天开奖"},
                          ];
    
    //加入到数据组中
    [self.groups addObject:[self setupChildViewWithArray:_array]];
}
@end
