//
//  FZQLotteryCollectionVCViewController.m
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQBaseLotteryCollectionVC.h"
#import "FZQLotteryBaseHV.h"
#import "MJRefresh.h"
#import "FZQCardCollectionViewCell.h"
#import "YYModel.h"
#import "YYWebImage.h"

#define LOTTERYHEADER @"lottery_header"
#define LOTTERYFOOTER @"lottery_footer"

@interface FZQBaseLotteryCollectionVC ()
@property (strong, nonatomic) FZQLotteryBaseHV *headerview;
@end

@implementation FZQBaseLotteryCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - 初始化数据
/** 初始化导航条 */
-(void)setUpNav
{
    /** 初始化导航条 */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageNamed:@"CS50_activity_image"] style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
}

- (void)SetData
{
    [self SetData_beforeNoti];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatas:) name:@"getLatestDatas" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatasFail:) name:@"getLatestDatasFail" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestHeaderDatas:) name:@"getLatestHeaderDatas" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatesHeadertDatasFail:) name:@"getLatestHeaderDatasFail" object:nil];
}

#pragma mark - 创建collectionview，将cell和headerview的注册交由用户决定
- (void)initSubView
{
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置单元格的尺寸
    //flowLayout.itemSize = CGSizeMake(10, 10);
    //设置头视图高度
    flowLayout.headerReferenceSize = CGSizeMake(self.navigationController.view.x, self.navigationController.view.y);
    //flowlaout的属性，横向滑动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 0.f;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
//    collectionView.y = - [self.tabBarController tabBar].h;
//    collectionView.h = collectionView.h - [self.tabBarController tabBar].h;
    self.collectionView = collectionView;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = BACKGROUPCOLOR;
    [self.view addSubview:self.collectionView];
    //设置页面底色
    self.view.backgroundColor = BACKGROUPCOLOR;
    
    //刷新动作
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(collectionViewHeaderRefresh)];
    
    //设置头视图的代理为本类
    //    self.headerview.bannerView.delegate = self;
    [self registerSubViewClass];
}

- (void)refreshWholeView {
    //刷新列表
    [self.collectionView reloadData];
    [self.collectionView.mj_header endRefreshing];
    [self userrefreshWholeView];
}

- (void)collectionViewHeaderRefresh
{
    [self.collectionView.mj_header beginRefreshing];
    [self.vm getLatestDatas];
    [self.vm getLatestHeaderDatas];
}
#pragma mark - 主内容更新
- (void)loadingLatestDatas :(NSNotification *)noti {
    [self refreshWholeView];
}

- (void)loadingLatestDatasFail :(NSNotification *)noti {
    [self.collectionView.mj_header endRefreshing];
}

#pragma mark - 头部数据更新
- (void)loadingLatestHeaderDatas :(NSNotification *)noti {
//    [self refreshWholeView];
}

- (void)loadingLatesHeadertDatasFail :(NSNotification *)noti {
//    [self.collectionView.mj_header endRefreshing];
}

#pragma mark - <UICollectionViewDelegateFlowLayout>代理
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake((self.view.w-0.5)/2.0, CELLHEIGHT);
    return size;
}
//设置每个collectionview item的边距都为0
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每行之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.5f;
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 0.f;
//}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = {SCREEN_WIDTH, 2.3*LOTTERY_HEADERVIEWHEIGH};
    return size;
}

#pragma mark - <UICollectionViewDataSource>代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getLatestDatas" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getLatestDatasFail" object:nil];
}

#pragma mark - test-debug method
- (void)testCalcNullData
{
    NSInteger nullNum = 0;
//    for (NSObject *object in self.vm) {
//        FQCard *card = [FQCard yy_modelWithJSON:object];
//        [card valueForKey:@"attribute"] ? ++nullNum : 0;
//    }
    debug("null num = %ld", (long)nullNum);
}

- (void)ShowData
{
//    debug("%@", self.vm);
}

#pragma mark - user method
- (void)SetData_beforeNoti {}
- (void)activity {}
- (void)registerSubViewClass {}
- (void)userrefreshWholeView {}

#pragma mark - Banner delegate
- (void)imageView:(UIImageView *)imageView loadImageForUrl:(NSString *)url {
    imageView.yy_imageURL = [NSURL URLWithString:url];
}
-(void)bannerView:(GGBannerView *)bannerView didSelectAtIndex:(NSUInteger)index {
}
@end
