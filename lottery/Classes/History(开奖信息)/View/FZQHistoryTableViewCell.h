//
//  FZQHistoryTableViewCell.h
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQHistoryModel.h"
#import "UIView+SDAutoLayout.h"
@interface FZQHistoryTableViewCell : UITableViewCell
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *subtitleLabel;
@property (weak, nonatomic) UIView *view;

@property (strong, nonatomic) FZQHistorySubModel *model;

+ (instancetype)CellWithTableView:(UITableView *)tableView;
@end


@interface BallView : UIView
@property (strong, nonatomic) NSArray *array;
- (void)setHeaderItemModelsArray:(NSArray *)headerItemModelsArray;
@end