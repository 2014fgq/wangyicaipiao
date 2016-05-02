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

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"adInfo" : [FQAdInfo class],
             @"cardList" : [FQCard class]};
}

@end

@implementation FQSubAttribute

@end

@implementation FQCard

@end

@implementation FQAdInfo

@end
