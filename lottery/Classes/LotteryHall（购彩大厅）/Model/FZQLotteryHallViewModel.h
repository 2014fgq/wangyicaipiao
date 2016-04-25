//
//  FZQLotteryHallViewModel.h
//  lottery
//
//  Created by IMAC on 16/4/22.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FZQLotteryHallModel.h"
@interface FZQLotteryHallViewModel : NSObject
@property (strong, nonatomic) FZQLotteryHallModel *model;
- (void)getLatestDatas;
@end
