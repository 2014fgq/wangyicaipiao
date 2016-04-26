//
//  FZQHistoryModel.h
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZQHistoryModel : NSObject
@property (strong, nonatomic) NSString *totalBonus;
@property (strong, nonatomic) NSArray *data;
@end

@interface FZQHistorySubModel : NSObject
@property (strong, nonatomic) NSString *awardNo;
@property (strong, nonatomic) NSString *awardTime;
@property (strong, nonatomic) NSString *extra;
@property (strong, nonatomic) NSString *gameEn;
@property (strong, nonatomic) NSString *luckyBlue;
@property (strong, nonatomic) NSString *periodName;
@property (strong, nonatomic) NSString *totalPool;
@property (strong, nonatomic) NSString *totalSale;
@end