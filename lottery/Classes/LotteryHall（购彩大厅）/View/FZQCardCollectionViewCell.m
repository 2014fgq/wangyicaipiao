//
//  FZQCardCollectionViewCell.m
//  lottery
//
//  Created by IMAC on 16/4/22.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQCardCollectionViewCell.h"
#import "YYModel.h"
#import "YYWebImage.h"
@implementation FZQCardCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)CardCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)IndexPath
{
    static NSString *ID = CardID;
    FZQCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:IndexPath];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    [cell setup];
    return cell;
}

//{"attribute":{"activityColor":"red","activityText":"1元拿iPhone6s","activityTextColor":"","badgeIcon":"","cardDesc":"1元就中iPhone6s","cardName":"欢乐购","jumpUrl":"ntescaipiao://hyg_hall","logo":"http://pimg1.126.net/caipiao_info/images/headFigure/newAppHall/1455593728301_1.png","rankMax":1,"rankMin":0,"shiftLeft":""},"id":"65","type":"3"},

- (void) setModel:(FQCard *)model {
    _model = model;
    
    self.imgView.yy_imageURL = [NSURL URLWithString:self.model.attribute.logo];
    
    self.titleLabel.text = self.model.attribute.cardName;
    //self.titleLabel.adjustsFontSizeToFitWidth = true;
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    
    self.detailLabel.text = self.model.attribute.cardDesc;
    self.detailLabel.textColor = [UIColor grayColor];
    //self.detailLabel.adjustsFontSizeToFitWidth = true;
    self.detailLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    
    
    if([self.model.attribute.activityColor isEqualToString:@"red"])
    {
        //self.detailLabel.backgroundColor = [UIColor redColor];
        //self.detailLabel.textColor = [UIColor whiteColor];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    NSInteger imgWidth = 40;
//    //self.imgView.alignmentRectInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.imgView.frame = CGRectMake(0, 0, imgWidth, imgWidth);
//    self.titleLabel.frame  = CGRectMake(imgWidth, 0, self.w-imgWidth, CELLHEIGHT/2);
//    self.detailLabel.frame = CGRectMake(imgWidth, CELLHEIGHT/2, self.w-imgWidth, 20);
    
    [self setup];
}
-(void)setup{
    
    // 设置约束
    //imgView的高占比80%
    self.imgView.sd_layout
    .leftSpaceToView(self, self.w*0.05)
    .topSpaceToView(self, self.h*0.2)
    .widthIs(self.w*0.3)
    .heightIs(self.h*0.6);
    
    //title的高占比为25%
    self.titleLabel.sd_layout
    .leftSpaceToView(self.imgView,self.w*0.05)
    .topEqualToView(self.imgView)
    .widthIs(self.w*0.6)
    .heightIs(self.h*0.2);
//
    //title的高占比为35%
    self.detailLabel.sd_layout
    .leftEqualToView(self.titleLabel)
    .topSpaceToView(self.titleLabel, self.h*0.1)
    .widthIs(self.w*0.6)
    .heightIs(self.h*0.25);
    
    //[self setupAutoHeightWithBottomViewsArray:@[_imgView, _detailLabel] bottomMargin:margin];
    [self setupAutoHeightWithBottomView:self.imgView bottomMargin:self.h*0.2];
}

#pragma mark - 懒加载
- (UILabel *)titleLabel
{
    if(!_titleLabel)
    {
        UILabel *label = [[UILabel alloc] init];
        _titleLabel = label;
        [self addSubview:_titleLabel];
    }
    return  _titleLabel;
}

- (UILabel *)detailLabel
{
    if(!_detailLabel)
    {
        UILabel *label = [[UILabel alloc] init];
        _detailLabel = label;
        [self addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UIImageView *)imgView
{
    if(!_imgView)
    {
        UIImageView *imgView = [[UIImageView alloc] init];
        _imgView = imgView;
        [self addSubview:_imgView];
    }
    return  _imgView;
}

@end
