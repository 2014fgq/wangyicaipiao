//
//  FZQGroupItem.m
//  lottery
//
//  Created by IMAC on 16/4/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQGroupItem.h"

#import "FZQBaseItem.h"



@implementation FZQGroupItem

#pragma mark - lazy load
-(NSMutableArray*)items{
    if (_items == nil) {
        //生成可变字典
        _items = [NSMutableArray array];
    }
    return _items;
}
@end
