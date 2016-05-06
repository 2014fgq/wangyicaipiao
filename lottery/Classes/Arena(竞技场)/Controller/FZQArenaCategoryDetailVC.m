//
//  FZQArenaCategoryDetailVC.m
//  lottery
//
//  Created by IMAC on 16/5/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaCategoryDetailVC.h"

@interface FZQArenaCategoryDetailVC ()

@end

@implementation FZQArenaCategoryDetailVC
#pragma mark - life cycle
- (void)SetData_beforeNoti
{
    self.vm = [FZQArenaVM new];
    [self.vm getLatestDatasByID:self.categoryID];
}


#pragma mark - <UICollectionViewDelegateFlowLayout>代理
//返回头headerView的大小，废弃头部
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = {SCREEN_WIDTH, 0};
    return size;
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    FZQArenaCategoryModelItem *model = [self.vm.model.categoryList objectAtIndex:indexPath.row];
//    FZQArenaCategoryDetailVC *vc = [[FZQArenaCategoryDetailVC alloc] init];
//    vc.categoryID = model.categoryId;
//    vc.title = model.categoryName;
//    [self.navigationController pushViewController:vc animated:YES];
//}

/** 初始化导航条，废弃导航栏 */
-(void)setUpNav
{
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
