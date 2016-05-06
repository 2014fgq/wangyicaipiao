//
//  FZQArenaViewController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaViewController.h"
#import "FZQArenaCollectionViewCell.h"
#import "FZQArenaHV.h"
#import "FZQLotteryWebVC.h"
#import "FZQArenaCategoryVC.h"

@interface FZQArenaViewController()
@property (strong, nonatomic) FZQArenaHV *headerview;
@end

#define LOTTERYHEADER @"lottery_header"
#define LOTTERYFOOTER @"lottery_footer"

@implementation FZQArenaViewController
@dynamic vm;
#pragma mark - life cycle
- (void)activity
{
    FZQArenaCategoryVC *vc = [[FZQArenaCategoryVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)SetData_beforeNoti
{
    self.vm = [FZQArenaVM new];
    [self.vm getLatestDatas];
    [self.vm getLatestHeaderDatas];
}

- (void)registerSubViewClass
{
    [self.collectionView registerClass:[FZQArenaCollectionViewCell class] forCellWithReuseIdentifier:ARENACELL];
    [self.collectionView registerClass:[FZQArenaHV class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:LOTTERYHEADER];
    [self.collectionView registerClass:[FZQArenaHV class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:LOTTERYFOOTER];

}

- (void)userrefreshWholeView
{
    //刷新Banner
    NSMutableArray * bannerUrlArray = [NSMutableArray arrayWithCapacity:self.vm.header_model.adInfos.count];
    for (FZQAdInfos *model in self.vm.header_model.adInfos) {
        if (nil != model.picture) {
            [bannerUrlArray addObject:model.picture];
        }
    }
    [self.headerview.bannerView configBanner:bannerUrlArray];
}

#pragma mark - <UICollectionViewDelegateFlowLayout>代理
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = {SCREEN_WIDTH, 1.7*LOTTERY_HEADERVIEWHEIGH};
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake((self.view.w-2)/2, 160);
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
    
    FZQArenaHV *view =  [collectionView dequeueReusableSupplementaryViewOfKind:kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        self.headerview = view;
        
        //设置头视图的代理为本类
        self.headerview.bannerView.delegate = self;
        
        self.headerview.header_model = self.vm.header_model;
        [self.headerview reloaddata];
        self.headerview.view.frame = CGRectMake(0, self.headerview.bannerView.h, SCREEN_WIDTH, 0.5*LOTTERY_HEADERVIEWHEIGH);
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        view.backgroundColor = [UIColor lightGrayColor];
//        view.label.text = [NSString stringWithFormat:@"这是footer:%ld",(long)indexPath.section];
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
    return self.vm.model.productList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FZQItemProductList *model = [self.vm.model.productList objectAtIndex:indexPath.row];
    FZQArenaCollectionViewCell *cell = [FZQArenaCollectionViewCell CellWithCollectionView:collectionView forIndexPath:indexPath];
    
    cell.model = model;
    
    return cell;
}


#pragma mark - Banner delegate
-(void)bannerView:(GGBannerView *)bannerView didSelectAtIndex:(NSUInteger)index {
//    if (index < self.vm.model.adInfos.count) {
//        FZQAdInfos *model = self.vm.model.adInfos[index];
//        if(model.clickUrl) {
//            FZQDiscoveryWebViewController *webVC = [[FZQDiscoveryWebViewController alloc] init];
//            webVC.url = model.clickUrl;
//            webVC.title = @"网易彩票";
//            [self.navigationController pushViewController:webVC animated:YES];
//        }
//    }
}

#if 0
#pragma mark - life cycle
-(void)loadView
{
    //加载图片
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    
    //设置主视图
    self.view = [[UIImageView alloc]initWithImage:image];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    /** 初始化导航条 */
    [self setUpNav];
}

/** 初始化导航条 */
-(void)setUpNav
{  
    /** 初始化导航条 */
    //生成选项按钮
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"足球",@"篮球"]];
    
    //设置正常背景图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //设置选中背景图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

    //默认选中第一个按钮
    seg.selectedSegmentIndex = 0;
   
    //设置主题颜色
    seg.tintColor = RGBACOLOR(0, 142,143, 1);
    
    //设置选中时文字颜色
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
//    seg.segmentedControlStyle = UISegmentedControlStyleBar;
    seg.segmentedControlStyle = UISegmentedControlStylePlain;//UISegmentedControlStyleBezeled;
    
    //设置导航条标题控件
    self.navigationItem.titleView = seg;
    
    //[self.view addSubview:seg];
}

#endif
@end
