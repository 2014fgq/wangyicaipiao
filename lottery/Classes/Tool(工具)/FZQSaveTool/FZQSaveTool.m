//
//  FZQSaveTool.m
//  lottery
//
//  Created by IMAC on 16/4/4.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQSaveTool.h"

@implementation FZQSaveTool

//保存方法
+(void)setObject:object forKey:key
{
    [USER_DEFAULT setObject:object forKey:key];
}

//读取方法
+(id)objectForKey:key
{
    return [USER_DEFAULT objectForKey:key];
}
@end
