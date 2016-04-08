//
//  FZQSettingCell.h
//  lottery
//
//  Created by IMAC on 16/4/7.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FZQBaseItem;

@interface FZQBaseCell : UITableViewCell

/** item */
@property (nonatomic, strong) FZQBaseItem *item;


/** 类创建方法 */
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)cellStyle;
@end
