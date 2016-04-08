//
//  FZQBaseItem.m
//  lottery
//
//  Created by IMAC on 16/4/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQBaseItem.h"

@implementation FZQBaseItem

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title
{
    FZQBaseItem *item = [[self alloc] init];
    
    item.title = title;
    item.icon = icon;
    
    return item;
}

@end
