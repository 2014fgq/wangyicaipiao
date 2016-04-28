//
//  FZQHallViewController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryHallViewController.h"
#import "FZQHudView.h"
#import "FZQMenuView.h"
#import "FZQCardCollectionViewCell.h"
#import "YYModel.h"
#import "MJRefresh.h"
#import "FZQLotteryHV.h"
#import "GGBannerView.h"
#import "YYWebImage.h"
#import "FZQDiscoveryWebViewController.h"

#define LOTTERYHEADER @"lottery_header"
#define LOTTERYFOOTER @"lottery_footer"

#define HEADERVIEWHEIGH 150

@interface FZQLotteryHallViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GGBannerViewDelegate>
@property (weak, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) GGBannerView * bannerView;
@property (strong, nonatomic) NSString *version;

@end

@implementation FZQLotteryHallViewController

#pragma mark - life cycle
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
    self.bannerView.interval = 4;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //关闭定时器自动滚动
    self.bannerView.interval = 0;
}

- (void)SetData
{
    self.vm = [FZQLotteryHallViewModel new];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatas:) name:@"getLatestDatas" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingLatestDatasFail:) name:@"getLatestDatasFail" object:nil];
    [self.vm getLatestDatas];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingPreviousDaily:) name:@"LoadPreviousDaily" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLatestDaily:) name:@"UpdateLatestDaily" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainScrollViewToTop:) name:@"TapStatusBar" object:nil];
//    [self.vm getLatestDatas];
}

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
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView = collectionView;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[FZQCardCollectionViewCell class] forCellWithReuseIdentifier:CardID];
    [self.collectionView registerClass:[FZQLotteryHV class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:LOTTERYHEADER];
    [self.collectionView registerClass:[FZQLotteryHV class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:LOTTERYFOOTER];
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
    //设置页面底色
    self.view.backgroundColor = BACKGROUPCOLOR;
    
    //刷新动作
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(collectionViewHeaderRefresh)];
    
    //合入头部图片滚动功能
    NSInteger bannerViewWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger bannerViewHeight = HEADERVIEWHEIGH;
    GGBannerView *bannerView = [[GGBannerView alloc]initWithFrame:CGRectMake(0, 0, bannerViewWidth, bannerViewHeight)];
    self.bannerView = bannerView;
    self.bannerView.delegate = self;
}

- (void)refreshWholeView {
    //刷新列表
    [self.collectionView reloadData];
    [self.collectionView.mj_header endRefreshing];
    //刷新Banner
    NSMutableArray * bannerUrlArray = [NSMutableArray arrayWithCapacity:self.vm.model.adInfo.count];
    for (FQAdInfo * model in self.vm.model.adInfo) {
        if (nil != model.picture) {
            [bannerUrlArray addObject:model.picture];
        }
    }
    [self.bannerView configBanner:bannerUrlArray];
}

- (void)collectionViewHeaderRefresh
{
    [self.collectionView.mj_header beginRefreshing];
    [self.vm getLatestDatas];
}

- (void)loadingLatestDatas :(NSNotification *)noti {
    self.cardList = self.vm.model.cardList;
    NSMutableArray *mutabarray = [NSMutableArray array];
    for (FQCard *card in self.cardList) {
        if([card valueForKeyPath:@"attribute.cardName"])
        {
            [mutabarray addObject:card];
        }
    }
    self.cardList = mutabarray;
    [self refreshWholeView];

}

- (void)loadingLatestDatasFail :(NSNotification *)noti {
    [self.collectionView.mj_header endRefreshing];
}

- (void)dealloc
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getLatestDatas" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getLatestDatasFail" object:nil];
}

/** 初始化导航条 */
-(void)setUpNav
{
    /** 初始化导航条 */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageNamed:@"CS50_activity_image"] style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
}

#pragma mark - hud
/* 活动 */
- (void)activity
{
    /** 弹出蒙板 */
    [FZQHudView show];
    
    /** 弹出菜单 */
    [FZQMenuView show];
}

#pragma mark - <UICollectionViewDelegateFlowLayout>代理
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(self.view.frame.size.width/2-1, CELLHEIGHT);
    return size;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.f;
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = {SCREEN_WIDTH, 2.3*HEADERVIEWHEIGH};
    return size;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]){
        reuseIdentifier = LOTTERYHEADER;
    }else{
        reuseIdentifier = LOTTERYFOOTER;
    }
    
    FZQLotteryHV *view =  [collectionView dequeueReusableSupplementaryViewOfKind:kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        view.backgroundColor = BACKGROUPCOLOR;
        [view addSubview:self.bannerView];
        //view.label.text = [NSString stringWithFormat:@"这是header:%ld",(long)indexPath.section];
        //view.label.font = [UIFont systemFontOfSize:20];
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        view.backgroundColor = [UIColor lightGrayColor];
        view.label.text = [NSString stringWithFormat:@"这是footer:%ld",(long)indexPath.section];
    }
    return view;
}

#pragma mark - <UICollectionViewDataSource>代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cardList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FQCard *model = [FQCard yy_modelWithJSON:[self.cardList objectAtIndex:indexPath.row]];
    
    FZQCardCollectionViewCell *cell = [FZQCardCollectionViewCell CardCellWithCollectionView:collectionView forIndexPath:indexPath];
    
    cell.model = model;
    //cell.delegate = self;
    
    return cell;
}

#pragma mark - Banner delegate
- (void)imageView:(UIImageView *)imageView loadImageForUrl:(NSString *)url {
    imageView.yy_imageURL = [NSURL URLWithString:url];
}

-(void)bannerView:(GGBannerView *)bannerView didSelectAtIndex:(NSUInteger)index {
    if (index < self.vm.model.adInfo.count) {
        FQAdInfo *model = self.vm.model.adInfo[index];
        if(model.clickHref) {
            FZQDiscoveryWebViewController *webVC = [[FZQDiscoveryWebViewController alloc] init];
            webVC.url = model.clickHref;
            webVC.title = @"网易彩票";
            [self.navigationController pushViewController:webVC animated:YES];
        }
    }
}

#pragma mark - test-debug method
- (void)testCalcNullData
{
    NSInteger nullNum = 0;
    for (NSObject *object in self.cardList) {
        FQCard *card = [FQCard yy_modelWithJSON:object];
        [card valueForKey:@"attribute"] ? ++nullNum : 0;
    }
    debug("null num = %ld", (long)nullNum);
}

- (void)ShowData
{
    debug("%@", self.cardList);
}

@end
