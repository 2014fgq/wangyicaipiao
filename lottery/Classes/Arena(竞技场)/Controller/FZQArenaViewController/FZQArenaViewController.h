//
//  FZQArenaViewController.h
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQBaseLotteryCollectionVC.h"
#import "FZQArenaVM.h"
@interface FZQArenaViewController : FZQBaseLotteryCollectionVC
@property (strong, nonatomic) FZQArenaVM *vm;
@end
