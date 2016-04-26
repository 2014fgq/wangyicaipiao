//
//  FZQHistoryVM.h
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FZQHistoryModel.h"
@interface FZQHistoryVM : NSObject
@property (strong, nonatomic) FZQHistoryModel *model;

- (void)getLatestDatas;
@end
