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

@interface FZQLotteryHallViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) UICollectionView *collectionView;

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
    flowLayout.headerReferenceSize = CGSizeMake(0, 0);
    //flowlaout的属性，横向滑动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView = collectionView;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[FZQCardCollectionViewCell class] forCellWithReuseIdentifier:CardID];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor blackColor];
    //self.view.backgroundColor = [UIColor whiteColor];
    
    //刷新动作
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(collectionViewHeaderRefresh)];
    
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
    [self.collectionView reloadData];
    [self.collectionView.mj_header endRefreshing];
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

- (void)testCalcNullData
{
    NSInteger nullNum = 0;
    for (NSObject *object in self.cardList) {
        FQCard *card = [FQCard yy_modelWithJSON:object];
        [card valueForKey:@"attribute"] ? ++nullNum : 0;
    }
    debug("null num = %d", nullNum);
}

- (void)ShowData
{
    debug("%@", self.cardList);
}

@end
