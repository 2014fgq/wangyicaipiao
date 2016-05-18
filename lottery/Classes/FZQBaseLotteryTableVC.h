//
//  FZQBaseLotteryTableVC.h
//  lottery
//
//  Created by IMAC on 16/5/7.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQLotteryBaseVM.h"
#import "FZQLotteryBaseHV.h"
#import "GGBannerView.h"
@interface FZQBaseLotteryTableVC : UITableViewController <GGBannerViewDelegate>
@property (strong, nonatomic) FZQLotteryBaseVM *vm;
@property (strong, nonatomic) FZQLotteryBaseHV *headerview;
@property (strong, nonatomic) UIView *footerview;
@end
