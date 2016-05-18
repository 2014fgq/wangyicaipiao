//
//  FZQProductDetailVCell.m
//  lottery
//
//  Created by IMAC on 16/5/8.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQProductDetailVCell.h"

@implementation FZQProductDetailVCell
//自定义单元格
+ (instancetype)CellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"productdetail_cell";
    FZQProductDetailVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[FZQProductDetailVCell alloc] initWithReuseIdentifier:ID];
    }
    
    //设置cell的属性
    // iOS 7 separator,没间距
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsZero;
    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

//保证cell的加载到父控件，frame不为0
- (void) layoutSubviews
{
    [super layoutSubviews];
}

-(void)setModel:(FZQProductMainItemModel *)model
{
    //赋值
    _model = model;
    //将Model赋给子控件
    self.textLabel.text = model.ProductName;
}

@end
