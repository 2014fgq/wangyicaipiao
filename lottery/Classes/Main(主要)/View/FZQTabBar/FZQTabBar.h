//
//  FZQTabBar.h
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZQTabBar : UIView

/** items */
@property (nonatomic, strong) NSArray *items;
/** 跳转block */
@property (nonatomic, copy) tabBarBlock tabBarBlock;

@end




