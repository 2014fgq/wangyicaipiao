//
//  FZQArenaCollectionViewCell.h
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQArenaModel.h"
#import "UIView+SDAutoLayout.h"
@interface FZQArenaCollectionViewCell : UICollectionViewCell
#define ARENACELL @"arena_cell"
@property (strong, nonatomic) FZQItemProductList *model;
@property (strong, nonatomic) UIImageView *imgView;
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIProgressView *proView;
@property (weak, nonatomic) UILabel *all;
@property (weak, nonatomic) UILabel *left;
@property (weak, nonatomic) UILabel *allnum;
@property (weak, nonatomic) UILabel *leftnum;
@property (weak, nonatomic) UIButton *button;

+ (instancetype)CellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)IndexPath;
@end
