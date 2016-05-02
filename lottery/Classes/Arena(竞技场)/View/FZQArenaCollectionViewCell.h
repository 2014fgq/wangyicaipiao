//
//  FZQArenaCollectionViewCell.h
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQArenaModel.h"
@interface FZQArenaCollectionViewCell : UICollectionViewCell
#define ARENACELL @"arena_cell"
@property (strong, nonatomic) FZQItemProductList *model;
@property (strong, nonatomic) UIImageView *imgView;



+ (instancetype)CellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)IndexPath;
@end
