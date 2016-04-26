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
@implementation FZQHistoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self initSubView];
    [self initNoti];
    //[self ViewHeaderRefresh];
    [self.vm getLatestDatas];
}

- (void)initData
{
    self.vm = [[FZQHistoryVM alloc] init];
}

- (void)initSubView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    headerView.backgroundColor = BACKGROUPCOLOR;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    label.text = @"网易彩票累计中奖金额";
    label.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:label];
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
@end
