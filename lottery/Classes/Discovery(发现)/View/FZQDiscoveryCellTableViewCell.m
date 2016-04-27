//
//  FZQDiscoveryCellTableViewCell.m
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQDiscoveryCellTableViewCell.h"
#import "YYWebImage.h"


@implementation FZQDiscoveryCellTableViewCell

//自定义单元格
+ (instancetype)DiscoveryCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"discovery_cell";
    FZQDiscoveryCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[FZQDiscoveryCellTableViewCell alloc] initWithReuseIdentifier:ID];
    }

    //设置cell的属性
    // iOS 7 separator,没间距
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsZero;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.backgroundColor = CLEARCOLOR;
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

- (void)setModel:(FQItmeDiscoveryModel *)model
{
    //self.imageView.yy_imageURL = [NSURL URLWithString:model.logoUrl];
    self.textLabel.text = model.title;
    self.detailTextLabel.text = model.desc;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}
@end
