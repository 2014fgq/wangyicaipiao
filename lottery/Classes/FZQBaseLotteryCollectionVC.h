//
//  FZQLotteryCollectionVCViewController.h
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQLotteryBaseVM.h"
#import "GGBannerView.h"
@interface FZQBaseLotteryCollectionVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GGBannerViewDelegate>
@property (strong, nonatomic) FZQLotteryBaseVM *vm;
@property (strong, nonatomic) UICollectionView *collectionView;

- (void)SetData_beforeNoti;
- (void)registerSubViewClass;
- (void)userrefreshWholeView;
@end
