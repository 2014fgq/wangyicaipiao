//
//  FZQGroupItem.h
//  lottery
//
//  Created by IMAC on 16/4/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FZQBaseItem;

@interface FZQGroupItem : NSMutableArray

/** header */
@property (nonatomic, weak) NSString *headerTitle;
/** footer */
@property (nonatomic, weak) NSString *footerTitle;
/** settingItem */
@property (nonatomic, strong) NSMutableArray *items;

@end
