//
//  FZQBaseItem.h
//  lottery
//
//  Created by IMAC on 16/4/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//
typedef void(^operationBlock)(NSIndexPath *indexPath);
#import <Foundation/Foundation.h>

@interface FZQBaseItem : NSObject

/** icon */
@property (nonatomic, weak) UIImage *icon;
/** title */
@property (nonatomic, weak) NSString *title;
/** subTitle */
@property (nonatomic, weak) NSString *subTitle;
// 保存每一行cell做的事情
@property (nonatomic, strong) void(^operationBlock)(NSIndexPath *indexPath);

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;
@end
