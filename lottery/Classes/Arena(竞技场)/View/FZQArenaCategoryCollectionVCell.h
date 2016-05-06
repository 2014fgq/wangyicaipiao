//
//  FZQArenaCategoryCollectionVC.h
//  lottery
//
//  Created by IMAC on 16/5/4.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQArenaCategoryModel.h"
#import "UIView+SDAutoLayout.h"
@interface FZQArenaCategoryCollectionVCell : UICollectionViewCell
#define ARENACATEGORYCELL @"arenacategory_cell"
@property (strong, nonatomic) FZQArenaCategoryModelItem *model;
@property (strong, nonatomic) UIImageView *imgView;


+ (instancetype)CellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)IndexPath;
@end
