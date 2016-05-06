//
//  FZQArenaCategoryCollectionVC.m
//  lottery
//
//  Created by IMAC on 16/5/4.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaCategoryCollectionVCell.h"
#import "YYWebImage.h"
@implementation FZQArenaCategoryCollectionVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)CellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)IndexPath
{
    static NSString *ID = ARENACATEGORYCELL;
    FZQArenaCategoryCollectionVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:IndexPath];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    [cell setup];
    return cell;
}

- (void)setModel:(FZQArenaCategoryModelItem *)model
{
    _model = model;
    self.imgView.yy_imageURL = [NSURL URLWithString:_model.categoryImageUrl];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setup
{
    // 设置约束
    self.imgView.sd_layout
    .leftSpaceToView(self,self.w*0.1)
    .topSpaceToView(self,self.h*0.1)
    .rightSpaceToView(self, self.w*0.1)
    .heightIs(self.h*0.8);
//    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:self.imgView bottomMargin:self.h*0.1];
}

- (UIImageView *)imgView
{
    if(!_imgView)
    {
        UIImageView *imgView = [[UIImageView alloc] init];
        _imgView = imgView;
        [self addSubview:_imgView];
    }
    return _imgView;
}
@end
