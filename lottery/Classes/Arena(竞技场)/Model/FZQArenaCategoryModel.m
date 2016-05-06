//
//  FZQArenaCategoryModel.m
//  lottery
//
//  Created by IMAC on 16/5/4.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaCategoryModel.h"

@implementation FZQArenaCategoryModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"categoryList" : [FZQArenaCategoryModelItem class]};
}
@end

@implementation FZQArenaCategoryModelItem

@end
