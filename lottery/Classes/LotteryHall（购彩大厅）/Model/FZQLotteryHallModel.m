//
//  FZQLotteryHallModel.m
//  lottery
//
//  Created by IMAC on 16/4/21.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryHallModel.h"

@implementation FZQLotteryHallModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"cardList" : @"card.cardList",
             @"layout" : @"card.layout"};
}

@end

@implementation FQSubAttribute

@end

@implementation FQCard

@end