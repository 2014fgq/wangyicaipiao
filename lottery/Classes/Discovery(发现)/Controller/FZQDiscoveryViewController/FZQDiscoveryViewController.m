//
//  FZQDiscoverViewController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQDiscoveryViewController.h"
#import "FZQAllLotteryViewController.h"
#import "MJRefresh.h"
#import "YYModel.h"
#import "YYWebImage.h"
#import "FZQDiscoveryCellTableViewCell.h"
#import "FZQLotteryWebVC.h"

@interface FZQDiscoveryViewController ()
@property (nonatomic) NSInteger seciotn;
@property (nonatomic) NSInteger row;
@end

@implementation FZQDiscoveryViewController

#pragma mark - life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initNoti];
    [self initData];
    
    /****** 初始化tableView *****/
    self.tableView.backgroundColor = BACKGROUPCOLOR;//背景颜色
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - init
- (void)initData
{
    self.vm = [FQDiscoveryVM alloc];
    [self.vm getLatestDatas];
}

- (void)initNoti
{
    //刷新动作
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(ViewHeaderRefresh)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatas:) name:@"getLatestDatas" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatasFail:) name:@"getLatestDatasFail" object:nil];
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

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = self.vm.model[indexPath.section];
    FQItmeDiscoveryModel *model = [FQItmeDiscoveryModel yy_modelWithJSON:[array objectAtIndex:indexPath.row]];
    /** 跳转界面 */
    if (![model.jumpUrl containsString:@"ntescaipiao"]) {
        FZQLotteryWebVC *webVC = [[FZQLotteryWebVC alloc] init];
        webVC.url = model.jumpUrl;
        webVC.title = @"网易彩票";
        [self.navigationController pushViewController:webVC animated:YES];
    }
    else {
        [self push];
    }
}

/* 跳转界面 */
- (void)push
{
    //生成跳转控制器
    UIViewController *vc = [[FZQAllLotteryViewController alloc]init];
        
    //跳转界面
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00001f;
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.vm.model.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.vm.model[section];
    return arr.count;
}

//"description":"免费送200元京东卡","groupFlag":true,"jumpUrl":"http://game.cp.163.com/nfop/tgnzjhfx/index.htm","logoUrl":"http://pimg1.126.net/caipiao_info/images/headFigure/appFigureConfig/1461236233028_1.png","promotionImgTime":"","promotionUrl":"","showAlert":true,"showAlertTime":"2015-08-22 13:20:20.0,2019-06-30 13:20:23.0","title":"网易棋牌"sdsadsa
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = self.vm.model[indexPath.section];
    FQItmeDiscoveryModel *model = [FQItmeDiscoveryModel yy_modelWithJSON:[array objectAtIndex:indexPath.row]];
    
    //生成cell
    FZQDiscoveryCellTableViewCell *cell = [FZQDiscoveryCellTableViewCell DiscoveryCellWithTableView:tableView];

    //根据model设置cell
    cell.model = model;
    
    return cell;
}

#pragma mark - private method
- (void) FQCalcSectionandRow
{
    self.seciotn = 0;
    self.row = 0;
    for (NSObject *obj in self.vm.model) {
        FQItmeDiscoveryModel *model = [FQItmeDiscoveryModel yy_modelWithJSON:obj];
        if(model.groupFlag)
            self.seciotn++;
        else
            self.row++;
    }
}
@end
