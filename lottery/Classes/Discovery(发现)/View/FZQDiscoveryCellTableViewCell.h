//
//  FZQDiscoveryCellTableViewCell.h
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQDiscoveryModel.h"
@interface FZQDiscoveryCellTableViewCell : UITableViewCell
@property (strong, nonatomic) FQItmeDiscoveryModel *model;

+ (instancetype)DiscoveryCellWithTableView:(UITableView *)tableView;
@end
