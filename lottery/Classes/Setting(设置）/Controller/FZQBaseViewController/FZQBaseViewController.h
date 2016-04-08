//
//  FZQBaseViewController.h
//  lottery
//
//  Created by IMAC on 16/4/6.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FZQGroupItem.h"

#import "FZQBaseItem.h"

#import "FZQArrowItem.h"

#import "FZQSwitchItem.h"

@interface FZQBaseViewController : UITableViewController

/** groups */
@property (nonatomic, copy) NSMutableArray *groups;

/* 设置所有数据 */
- (void)setAllGroups;
- (FZQGroupItem *)setupChildViewWithArray:(NSArray *)array;
- (FZQBaseItem *)setupChildViewWithDict:(NSDictionary *)dict;
@end
