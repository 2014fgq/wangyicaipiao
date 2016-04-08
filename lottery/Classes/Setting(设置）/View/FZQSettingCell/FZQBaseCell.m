//
//  FZQSettingCell.m
//  lottery
//
//  Created by IMAC on 16/4/7.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQBaseCell.h"

#import "FZQBaseItem.h"

#import "FZQArrowItem.h"

#import "FZQSwitchItem.h"

@interface FZQBaseCell ()

/** switch */
@property (nonatomic, strong) UISwitch *Switch;
@end

@implementation FZQBaseCell

#pragma mark - lazy load
- (UISwitch *)Switch
{
    if (_Switch == nil) {
        _Switch = [[UISwitch alloc] init];
    }
    return _Switch;
}

#pragma mark - init
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)cellStyle
{
    //设定标识
    static NSString *ID ;
    ID = [self getString];
    
    //从缓存中取出cell
    FZQBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //创建cell
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:cellStyle reuseIdentifier:ID];
    }
    
    return cell;
}

#pragma mark - setUp
- (void)setItem:(FZQBaseItem *)item
{
    _item = item;
    
    // 设置cell的内容,获取对应的行
    [self setUpData];
    
    // 设置辅助视图
    [self setUpAccessoryView];
    
}

// 设置数据
- (void)setUpData
{
    self.textLabel.text = self.item.title;
    self.imageView.image = self.item.icon;
    self.detailTextLabel.text = self.item.subTitle;
}

// 设置右边的辅助视图
- (void)setUpAccessoryView
{
    //根据item类型设置cell辅助配件类型
    if ([_item isKindOfClass:[FZQSwitchItem class]]) {
        //开关
        self.accessoryView = self.Switch;
        
    }else if([_item isKindOfClass:[FZQArrowItem class]]){
        //箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.accessoryView = nil;
    }else if([_item isKindOfClass:[FZQBaseItem class]]){
        //空
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = nil;
    }
}

#pragma mark - other
#pragma mark getString（截取字符串）
/* 截取字符串 */
+ (NSMutableString *)getString
{
    /** 截取字符串 */
    NSMutableString *tempStr = [NSMutableString stringWithFormat:@"%@",NSStringFromClass([self class])];
    //删除类前缀
    NSRange range = [tempStr rangeOfString:@"FZQ"];
    [tempStr deleteCharactersInRange:range];
    //删除控制器后缀名
    range = [tempStr rangeOfString:@"Cell"];
    [tempStr deleteCharactersInRange:range];
    
    return tempStr;
}
@end
