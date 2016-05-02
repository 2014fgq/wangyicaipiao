//
//  FZQArenaCollectionViewCell.m
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaCollectionViewCell.h"
#import "YYWebImage.h"
@implementation FZQArenaCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)CellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)IndexPath
{
    static NSString *ID = ARENACELL;
    FZQArenaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:IndexPath];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (void)setModel:(FZQItemProductList *)model
{
    _model = model;
    //self.imgView.
    self.imgView.yy_imageURL = [NSURL URLWithString:model.productUrl];
}

- (void)layoutSubviews
{
    return [super layoutSubviews];
}

- (UIImageView *)imgView
{
    if(!_imgView)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imgView = imgView;
        [self addSubview:_imgView];
    }
    return _imgView;
}

@end
