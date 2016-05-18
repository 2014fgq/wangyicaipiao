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
    [cell setup];
    
    return cell;
}

- (void)setModel:(FZQItemProductList *)model
{
    _model = model;
    //self.imgView.
    self.imgView.yy_imageURL = [NSURL URLWithString:model.productUrl];
    self.label.text = _model.productName;
    self.label.textAlignment = NSTextAlignmentCenter;
    
    self.proView.progress = _model.remainTimes / _model.totalTimes;
    self.allnum.text = [NSString stringWithFormat:@"%ld", (long)_model.totalTimes];
    self.all.text = @"总数";
    
    self.leftnum.text = [NSString stringWithFormat:@"%ld", (long)_model.remainTimes];
    
    self.left.text = @"剩余";
    
    [self.button setTitle:@"参与" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //配置label，文字颜色和大小
    self.label.font = [UIFont fontWithName:@"Helvetica" size:12];
    
    //配置总数量的label，文字颜色和大小
    self.allnum.textColor = [UIColor grayColor];
    self.allnum.font = [UIFont fontWithName:@"Helvetica" size:10];
    
    //配置总数文字的label，文字颜色和大小
    self.all.textColor = [UIColor grayColor];
    self.all.font = [UIFont fontWithName:@"Helvetica" size:10];

    //配置剩余文字的label，文字颜色和大小
    self.leftnum.textColor = [UIColor redColor];
    self.leftnum.font = [UIFont fontWithName:@"Helvetica" size:10];
    
    //配置剩余文字的label，文字颜色和大小
    self.left.textColor = [UIColor grayColor];
    self.left.font = [UIFont fontWithName:@"Helvetica" size:10];
    
    //配置圆角
    [self.button.layer setBorderWidth:1.0];
    [self.button.layer setBorderColor:[UIColor redColor].CGColor];
    self.button.layer.cornerRadius = 4;
    self.button.layer.masksToBounds = true;

    
}

- (void)initSubView
{
    UIImageView *imgView = [[UIImageView alloc] init];
    _imgView = imgView;
    [self addSubview:_imgView];
    
    UILabel *label = [[UILabel alloc] init];
    _label = label;
    [self addSubview:_label];
    
    UILabel *all = [[UILabel alloc] init];
    _all = all;
    [self addSubview:_all];
    
    UILabel *left = [[UILabel alloc] init];
    _left = left;
    [self addSubview:_left];
    
    UILabel *allnum = [[UILabel alloc] init];
    _allnum = allnum;
    [self addSubview:_allnum];
    
    UILabel *leftnum = [[UILabel alloc] init];
    _leftnum = leftnum;
    [self addSubview:_leftnum];
    
    UIProgressView *proView = [[UIProgressView alloc] init];
    _proView = proView;
    [self addSubview:proView];
    
    UIButton *btn = [[UIButton alloc] init];
    _button = btn;
    [self addSubview:_button];
}

-(void)setup{
    //[self initSubView];
    // 设置约束
    
    //img 高占比62%
    self.imgView.sd_layout
    .leftSpaceToView(self,self.w*0.2)
    .topSpaceToView(self,self.h*0.1)
    .rightSpaceToView(self, self.w*0.2)
    .heightIs(self.h*0.52);
    //    .maxHeightIs(self.h);
    //    .autoHeightRatio(0);
    
    //label 高占比10%
    self.label.sd_layout
//    .leftEqualToView(self.imgView)
    .topSpaceToView(self.imgView, self.h*0.02)
//    .rightEqualToView(self.imgView)
    .widthIs(self.w)
    .heightIs(self.h*0.08);
    
    //高占比15%
    self.proView.sd_layout
    .leftSpaceToView(self, self.w*0.1)
    .topSpaceToView(self.label, self.h*0.05)
    .widthIs(self.w*0.55)
    .heightIs(self.h*0.05);
    
    //高占比10%
    self.allnum.sd_layout
    .leftEqualToView(self.proView)
    .topSpaceToView(self.proView, self.h*0.025)
    .widthIs(self.proView.w*0.5)
//    .maxWidthIs(self.w*0.5)
    .heightIs(self.h*0.075);
    
    //高占比10%
    self.all.sd_layout
    .leftEqualToView(self.allnum)
    .topSpaceToView(self.allnum, self.h*0.0025)
    .widthIs(self.proView.w*0.5)
    .heightIs(self.h*0.075);
//    .autoHeightRatio(0);
    
    self.leftnum.sd_layout
    .topEqualToView(self.allnum)
//    .rightEqualToView(self.proView)
    .widthIs(self.allnum.w)
    .rightSpaceToView(self, self.w*0.2)
    .heightIs(self.allnum.h);
    
    self.left.sd_layout
    .topEqualToView(self.all)
//    .rightEqualToView(self.proView)
    .widthIs(self.all.w)
    .rightSpaceToView(self, self.w*0.2)
    .heightIs(self.all.h);
    
    self.button.sd_layout
    .leftSpaceToView(self.proView, 10)
    .topEqualToView(self.proView)
//    .rightSpaceToView(self, self.w*0.1)
    .widthIs(self.w*0.25)
    .heightIs(self.h*0.15);
    
    //[self setupAutoHeightWithBottomViewsArray:@[_imgView, _detailLabel] bottomMargin:margin];
    [self setupAutoHeightWithBottomView:self.all bottomMargin:self.h*0.03];
}

UILAZY(imgView, UIImageView)
UILAZY(label, UILabel)
UILAZY(allnum, UILabel)
UILAZY(all, UILabel)
UILAZY(leftnum, UILabel)
UILAZY(left, UILabel)
UILAZY(button, UIButton)
UILAZY(proView, UIProgressView)

@end
