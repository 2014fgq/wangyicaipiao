//
//  FZQHallViewController.h
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQLotteryHallViewModel.h"
@interface FZQLotteryHallViewController : UIViewController
@property (strong, nonatomic) FZQLotteryHallViewModel *vm;
@property (strong, nonatomic) NSArray *cardList;
@end
