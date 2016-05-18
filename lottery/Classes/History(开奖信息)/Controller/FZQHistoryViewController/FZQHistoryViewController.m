//
//  FZQHistoryViewController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQHistoryViewController.h"
#import "FZQHistoryTableViewCell.h"
#import "FZQHisSettingTableViewController.h"
#import "MJRefresh.h"
#import "YYModel.h"
#import "FZQHistoryTableHV.h"

@implementation FZQHistoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self initSubView];
    [self initNoti];
    //[self ViewHeaderRefresh];
}

- (void)initData
{
    self.vm = [[FZQHistoryVM alloc] init];
    [self.vm getLatestDatas];
}

- (void)initSubView
{
    FZQHistoryTableHV *headerView = [[FZQHistoryTableHV alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    self.tableView.tableHeaderView = headerView;
    //刷新动作
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(ViewHeaderRefresh)];

    //右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"开奖推送" style:UIBarButtonItemStyleDone target:self action:@selector(settingToPush)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)initNoti
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatas:) name:@"getLatestDatas" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatasFail:) name:@"getLatestDatasFail" object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getLatestDatas" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getLatestDatasFail" object:nil];
}

- (void)ViewHeaderRefresh
{
    [self.tableView.mj_header beginRefreshing];
    [self.vm getLatestDatas];
}

- (void)loadingLatestDatas :(NSNotification *)noti {
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

- (void)loadingLatestDatasFail :(NSNotification *)noti {
    [self.tableView.mj_header endRefreshing];
}

- (void)settingToPush
{
    FZQHisSettingTableViewController *vc = [[FZQHisSettingTableViewController alloc ] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.model.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FZQHistorySubModel *model = [FZQHistorySubModel yy_modelWithJSON:[self.vm.model.data objectAtIndex:indexPath.row]];
    
    FZQHistoryTableViewCell *cell = [FZQHistoryTableViewCell CellWithTableView:tableView];
    cell.model = model;
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - private method
- (NSString *)datamap:(NSString *)str
{
    NSDictionary *dict = @{@"ssq"        : @"双色球",
                           @""       : @"竞彩篮球",//
                           @""       : @"快乐扑克",//
                           @"football_9" : @"胜负彩/任选九",
                           @"football_sfc" : @"胜负彩/任选九",
                           @"ssc"        : @"重庆时时彩",
                           @"qxc"        : @"七星彩",
                           @""       : @"竞彩足球",//
                           @"d11"        : @"11选5",
                           @"gdd11"      : @"粤11选5",
                           @"jxd11"      : @"老11选5",
                           @""           : @"重庆11选5",//
                           @"lnd11"      : @"辽宁11选5",
                           @"hljd11"     : @"好运11选5",
                           @"zjd11"      : @"易乐11选5",
                           @"gxkuai3"    : @"新快3",
                           @"oldkuai3"   : @"江苏快3",
                           @"hbkuai3"    : @"湖北快3",
                           @"kuai3"      : @"快3",
                           @"ahkuai3"    : @"好运快3",
                           @"nmgkuai3"   : @"易快3",
                           @"dlt"        : @"大乐透",
                           @"x3d"        : @"3D",
                           @"jxssc"      : @"新时时彩",
                           @""           : @"足球单场",//
                           @"kl10"       : @"粤快乐十分",
                           @""           : @"胜负过关",//
                           @"kl8"        : @"快乐8",
                           @"qlc"        : @"七乐彩",
                           @""           : @"排列5", //
                           @"pl3"        : @"排列3",
                           //
                           @"football_f4cjq" : @"",
                           @"feiyu"      : @"",
                           @"football_bqc" : @"",
                           @"klpk"       : @"",
                           
    };
    
    if([dict valueForKey:str])
    {
        return dict[str];
    }
    else
    {
        return str;
    }
}

@end
