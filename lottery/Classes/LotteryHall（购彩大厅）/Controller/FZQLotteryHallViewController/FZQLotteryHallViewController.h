//
//  FZQHallViewController.h
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQLotteryHallVM.h"
#import "FZQBaseLotteryCollectionVC.h"
@interface FZQLotteryHallViewController : FZQBaseLotteryCollectionVC
@property (strong, nonatomic) FZQLotteryHallVM *vm;

@end
