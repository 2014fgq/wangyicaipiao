//
//  FZQArenaCategoryCollectionVC.m
//  lottery
//
//  Created by IMAC on 16/5/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaCategoryVC.h"
#import "FZQArenaCategoryCollectionVCell.h"
#import "FZQArenaCategoryDetailVC.h"
@interface FZQArenaCategoryVC ()

@end

@implementation FZQArenaCategoryVC
@dynamic vm;

#pragma mark - life cycle
- (void)activity
{
}
- (void)SetData_beforeNoti
{
    self.vm = [FZQArenaCategoryVM new];
    [self.vm getLatestDatas];
}

- (void)registerSubViewClass
{
    [self.collectionView registerClass:[FZQArenaCategoryCollectionVCell class] forCellWithReuseIdentifier:ARENACATEGORYCELL];
}
/** 初始化导航条，废弃导航栏 */
-(void)setUpNav
{
}
#pragma mark - <UICollectionViewDelegateFlowLayout>代理
//返回头headerView的大小,去掉头部
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = {0, 0};
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake((self.view.w-2)/4.0, 70);
    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.1f;
}
#pragma mark - <UICollectionViewDataSource>代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.vm.model.categoryList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FZQArenaCategoryModelItem *model = [self.vm.model.categoryList objectAtIndex:indexPath.row];
    FZQArenaCategoryCollectionVCell *cell = [FZQArenaCategoryCollectionVCell CellWithCollectionView:collectionView forIndexPath:indexPath];
    
    cell.model = model;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FZQArenaCategoryModelItem *model = [self.vm.model.categoryList objectAtIndex:indexPath.row];
    FZQArenaCategoryDetailVC *vc = [[FZQArenaCategoryDetailVC alloc] init];
    vc.categoryID = model.categoryId;
    vc.title = model.categoryName;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
