//
//  FZQHistoryTableViewCell.h
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQHistoryModel.h"
@interface FZQHistoryTableViewCell : UITableViewCell
@property (strong, nonatomic) FZQHistorySubModel *model;

+ (instancetype)CellWithTableView:(UITableView *)tableView;
@end
