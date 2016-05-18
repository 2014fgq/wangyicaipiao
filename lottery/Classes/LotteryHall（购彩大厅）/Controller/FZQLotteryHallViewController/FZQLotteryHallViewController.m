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
#import "YYWebImage.h"
#import "FZQLotteryWebVC.h"
#import "FZQArenaCategoryVC.h"
#import "FZQArenaViewController.h"
#define LOTTERYHEADER @"lottery_header"
#define LOTTERYFOOTER @"lottery_footer"

@interface FZQLotteryHallViewController ()
@property (strong, nonatomic) NSString *version;
@property (strong, nonatomic) FZQLotteryHV *headerview;
@property (strong, nonatomic) NSArray *cardlist;
@end

@implementation FZQLotteryHallViewController
@dynamic vm;
#pragma mark - life cycle
- (void)activity
{
    FZQArenaCategoryVC *vc = [[FZQArenaCategoryVC alloc] init];
//    FZQArenaViewController *vc = [[FZQArenaViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)SetData_beforeNoti
{
    self.vm = [FZQLotteryHallVM new];
    [self.vm getLatestDatas];
}

- (void)registerSubViewClass
{
    [self.collectionView registerClass:[FZQCardCollectionViewCell class] forCellWithReuseIdentifier:CardID];
    [self.collectionView registerClass:[FZQLotteryHV class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:LOTTERYHEADER];
    [self.collectionView registerClass:[FZQLotteryHV class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:LOTTERYFOOTER];
}

- (void)userrefreshWholeView
{
    //刷新Banner
    NSMutableArray * bannerUrlArray = [NSMutableArray arrayWithCapacity:self.vm.model.adInfo.count];
    for (FQAdInfo * model in self.vm.model.adInfo) {
        if (nil != model.picture) {
            [bannerUrlArray addObject:model.picture];
        }
    }
    [self.headerview.bannerView configBanner:bannerUrlArray];
    
    //过滤空的cardName
    NSMutableArray *mutabarr = [NSMutableArray array];
    for (FQCard *model in self.vm.model.cardList){
        if (nil != model.attribute.cardName)
        {
            [mutabarr addObject:model];
        }
    }
    self.cardlist = mutabarr;
}

#pragma mark - hud
/* 活动 */
//- (void)activity
//{
//    /** 弹出蒙板 */
//    [FZQHudView show];
//    /** 弹出菜单 */
//    [FZQMenuView show];
//}

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
        self.headerview = view;
        
        //设置头视图的代理为本类
        self.headerview.bannerView.delegate = self;
        self.headerview.view.frame = CGRectMake(0, self.headerview.bannerView.h, SCREEN_WIDTH, 1.2*LOTTERY_HEADERVIEWHEIGH);
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
    //return self.vm.model.cardList.count;
    return self.cardlist.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FQCard *model = [self.cardlist objectAtIndex:indexPath.row];
    FZQCardCollectionViewCell *cell = [FZQCardCollectionViewCell CardCellWithCollectionView:collectionView forIndexPath:indexPath];
    
    cell.model = model;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FQCard *model = [self.vm.model.cardList objectAtIndex:indexPath.row];
    FZQLotteryWebVC *vc = [[FZQLotteryWebVC alloc] init];
    
    vc.url = model.attribute.jumpUrl;
    vc.title = model.attribute.cardName;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Banner delegate
-(void)bannerView:(GGBannerView *)bannerView didSelectAtIndex:(NSUInteger)index {
    if (index < self.vm.model.adInfo.count) {
        FQAdInfo *model = self.vm.model.adInfo[index];
        if(model.clickHref) {
            FZQLotteryWebVC *webVC = [[FZQLotteryWebVC alloc] init];
            webVC.url = model.clickHref;
            webVC.title = @"网易彩票";
            [self.navigationController pushViewController:webVC animated:YES];
        }
    }
}

@end
