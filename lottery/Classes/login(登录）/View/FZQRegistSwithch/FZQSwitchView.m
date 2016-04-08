//
//  FZQSwitchView.m
//  addressList
//
//  Created by IMAC on 16/3/14.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQSwitchView.h"

@implementation FZQSwitchView

/** 类创建方法 */
+(id)switchView
{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

@end
