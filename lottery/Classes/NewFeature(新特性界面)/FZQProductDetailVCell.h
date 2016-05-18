//
//  FZQProductDetailVCell.h
//  lottery
//
//  Created by IMAC on 16/5/8.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FZQProductDetailModel.h"
@interface FZQProductDetailVCell : UITableViewCell
@property (strong, nonatomic) FZQProductMainItemModel *model;

+ (instancetype)CellWithTableView:(UITableView *)tableView;
@end
