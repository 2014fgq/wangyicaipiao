//
//  FZQSaveTool.h
//  lottery
//
//  Created by IMAC on 16/4/4.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZQSaveTool : NSObject

//保存方法
+(void)setObject:object forKey:key;

//读取方法
+(id)objectForKey:key;
@end
