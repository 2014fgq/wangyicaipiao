//
//  FZQProductDetailVC.m
//  lottery
//
//  Created by IMAC on 16/5/8.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQProductDetailVC.h"
#import "FZQProductDetailVM.h"
#import "FZQProductDetailVCell.h"
@interface FZQProductDetailVC ()

@end

@implementation FZQProductDetailVC
@dynamic vm;
#pragma mark - user method
- (void)UpdateData
{
    if(!self.vm)
        self.vm = [FZQProductDetailVM new];
    [self.vm getLatestHeaderDatas];
    [self.vm getLatestDatas];
}

- (void)initUserSubView
{
    //添加Headerview
    self.headerview = [[FZQLotteryBaseHV alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    
    self.tableView.tableHeaderView = self.headerview;
    
    self.headerview.bannerView.delegate = self;
    
    //添加footerview
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.footerview = tableview;
    tableview.backgroundColor = [UIColor blueColor];
    self.tableView.tableFooterView = self.footerview;
}

#pragma mark - 处理数据消息
//头部数据更新
- (void)loadingLatestHeaderDatas :(NSNotification *)noti {
    //刷新Banner
    NSMutableArray * bannerUrlArray = [NSMutableArray arrayWithCapacity:self.vm.header_model.product.productImages.count];
    for (NSString *str in self.vm.header_model.product.productImages){
        if (nil != str) {
            [bannerUrlArray addObject:str];
        }
    }
    [self.headerview.bannerView configBanner:bannerUrlArray];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.model.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FZQProductMainItemModel *model = [self.vm.model.array objectAtIndex:indexPath.row];
    FZQProductDetailVCell *cell = [FZQProductDetailVCell CellWithTableView:tableView];
    cell.model = model;
    return cell;
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20.f;
}

@end
