//
//  FZQArenaModel.m
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaModel.h"

@implementation FZQArenaModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"adInfos" : [FZQAdInfos class],
             @"quickNavigation" : [FZQQuickNavigation class],
             @"productTabs" : [FZQProductTabs class]};
}
@end

@implementation FZQQuickNavigation
@end

@implementation FZQProductTabs
@end

@implementation FZQAdInfos
@end

@implementation FZQProductModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"productList" : [FZQItemProductList class]};
}
@end

@implementation FZQItemProductList
@end


