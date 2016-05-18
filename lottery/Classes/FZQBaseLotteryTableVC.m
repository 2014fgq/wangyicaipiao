//
//  FZQBaseLotteryTableVC.m
//  lottery
//
//  Created by IMAC on 16/5/7.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQBaseLotteryTableVC.h"
#import "MJRefresh.h"
#import "YYWebImage.h"
@interface FZQBaseLotteryTableVC ()

@end

@implementation FZQBaseLotteryTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 初始化导航条 */
    [self setUpNav];
    
    //初始化collection
    [self initSubView];
    
    //初始化数据
    [self SetData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //打开定时器自动滚动
    self.headerview.bannerView.interval = 4;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //关闭定时器自动滚动
    self.headerview.bannerView.interval = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建tableview，将cell和headerview的注册交由用户决定
#pragma mark - 初始化数据
/** 初始化导航条 */
-(void)setUpNav
{
    /** 初始化导航条 */
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageNamed:@"CS50_activity_image"] style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
}

- (void)initSubView
{
    //设置页面底色
    self.view.backgroundColor = BACKGROUPCOLOR;
    
    //刷新动作
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(ViewHeaderRefresh)];

    //设置头视图的代理为本类
    //    self.headerview.bannerView.delegate = self;
    //    [self registerSubViewClass];
    
    //加载每个tablewview的差异
    [self initUserSubView];

}

- (void)SetData
{
    [self UpdateData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatas:) name:@"getLatestDatas" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatasFail:) name:@"getLatestDatasFail" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestHeaderDatas:) name:@"getLatestHeaderDatas" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatesHeadertDatasFail:) name:@"getLatestHeaderDatasFail" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestFooterDatas:) name:@"getLatestFooterDatas" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatesFootertDatasFail:) name:@"getLatestFooterDatasFail" object:nil];

}

- (void)ViewHeaderRefresh
{
    [self.tableView.mj_header beginRefreshing];
//    [self.vm getLatestDatas];
//    [self.vm getLatestHeaderDatas];
    [self UpdateData];
}

- (void)refreshWholeView {
    //刷新列表
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    [self userrefreshWholeView];
}

#pragma mark - 数据消息的处理
//主内容更新
- (void)loadingLatestDatas :(NSNotification *)noti {
    [self refreshWholeView];
}

- (void)loadingLatestDatasFail :(NSNotification *)noti {
    [self.tableView.mj_header endRefreshing];
}

//头部数据更新
- (void)loadingLatestHeaderDatas :(NSNotification *)noti {
}

- (void)loadingLatesHeadertDatasFail :(NSNotification *)noti {
}

//尾部数据更新
- (void)loadingLatestFooterDatas :(NSNotification *)noti {
}

- (void)loadingLatesFootertDatasFail :(NSNotification *)noti {
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.f;
}

#pragma mark - Banner delegate
- (void)imageView:(UIImageView *)imageView loadImageForUrl:(NSString *)url {
    imageView.yy_imageURL = [NSURL URLWithString:url];
}
-(void)bannerView:(GGBannerView *)bannerView didSelectAtIndex:(NSUInteger)index {
}

#pragma mark - user method
- (void)UpdateData {}
- (void)userrefreshWholeView {}
- (void)initUserSubView {};
@end
