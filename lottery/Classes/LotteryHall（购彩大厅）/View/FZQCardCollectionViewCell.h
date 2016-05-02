//
//  FZQCardCollectionViewCell.h
//  lottery
//
//  Created by IMAC on 16/4/22.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQLotteryHallModel.h"
#import "UIView+SDAutoLayout.h"
@interface FZQCardCollectionViewCell : UICollectionViewCell
#define CardID @"card_cell"
@property (weak, nonatomic) UIImageView *imgView;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) FQCard *model;

//- (void)setModel:(FQCard *)model;
+ (instancetype)CardCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)IndexPath;
@end
