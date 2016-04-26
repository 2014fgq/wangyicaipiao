//
//  FZQHistoryTableViewCell.m
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQHistoryTableViewCell.h"

@implementation FZQHistoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//自定义单元格
+ (instancetype)CellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"History_cell";
    FZQHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[FZQHistoryTableViewCell alloc] initWithReuseIdentifier:ID];
    }

    return cell;
}

//重写initWithReuseIdentifier方法，在创建cell的时候，同时创建子控件
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        //在这里加上子控件的代码
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setModel:(FZQHistorySubModel *)model
{
    self.textLabel.text = model.gameEn;
    self.detailTextLabel.text = model.awardTime;
}
@end
