//
//  FZQArenaHV.h
//  lottery
//
//  Created by IMAC on 16/4/30.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQLotteryBaseHV.h"
#import "SDDiscoverTableViewHeader.h"
#import "FZQArenaModel.h"
@interface FZQArenaHV : FZQLotteryBaseHV
@property (strong, nonatomic) UIView *view;
@property (nonatomic, strong) NSArray *headerDataArray;
@property (strong, nonatomic) FZQArenaModel *header_model;

- (void)reloaddata;
@end
