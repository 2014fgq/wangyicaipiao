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
    
    return cell;
}

//{"attribute":{"activityColor":"red","activityText":"1元拿iPhone6s","activityTextColor":"","badgeIcon":"","cardDesc":"1元就中iPhone6s","cardName":"欢乐购","jumpUrl":"ntescaipiao://hyg_hall","logo":"http://pimg1.126.net/caipiao_info/images/headFigure/newAppHall/1455593728301_1.png","rankMax":1,"rankMin":0,"shiftLeft":""},"id":"65","type":"3"},

- (void) setModel:(FQCard *)model {
    _model = model;
    
    self.imgView.yy_imageURL = [NSURL URLWithString:self.model.attribute.logo];
    
    self.titleLabel.text = self.model.attribute.cardName;
    
    self.detailLabel.text = self.model.attribute.cardDesc;
    self.detailLabel.textColor = [UIColor grayColor];
    self.detailLabel.adjustsFontSizeToFitWidth = true;
    if([self.model.attribute.activityColor isEqualToString:@"red"])
    {
        self.detailLabel.backgroundColor = [UIColor redColor];
        self.detailLabel.textColor = [UIColor whiteColor];
    }
}

- (void)layoutSubviews {
    NSInteger imgWidth = 60;
    self.titleLabel.frame  = CGRectMake(imgWidth, 0, 160, CELLHEIGHT/2);
    self.detailLabel.frame = CGRectMake(imgWidth, CELLHEIGHT/2, 40, 20);
    self.imgView.frame = CGRectMake(0, 0, imgWidth, CELLHEIGHT);
}

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
