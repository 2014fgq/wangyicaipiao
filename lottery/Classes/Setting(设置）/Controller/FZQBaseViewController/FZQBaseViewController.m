//
//  FZQSettingViewController.m
//  lottery
//
//  Created by IMAC on 16/4/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQBaseViewController.h"

#import "FZQBaseCell.h"



@interface FZQBaseViewController ()


@end

@implementation FZQBaseViewController

#pragma mark - lazy load
-(NSMutableArray*)groups{
    if (_groups == nil) {
        
        //生成可变字典
        _groups = [NSMutableArray array];
        
        //加载所有数据
        [self setAllGroups];
    }
    return _groups;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置分隔线形式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
}

/** 初始化tableView */
- (instancetype)init
{   
    /** 设置tableView分组 */
    return [self initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - setGroupItem
/* 设置所有数据 */
- (void)setAllGroups
{
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //获取组模型
    FZQGroupItem *group = self.groups[section];
    
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //从缓存中取出cell或生成cell
    FZQBaseCell *cell = [FZQBaseCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    
    //获取模型数据
    FZQGroupItem *group = self.groups[indexPath.section];
    FZQBaseItem *item = group.items[indexPath.row];
    
    //设置cell
    cell.item = item;
        
    return cell;
}

#pragma mark - <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取模型数据
    FZQGroupItem *group = self.groups[indexPath.section];
    FZQBaseItem *item = group.items[indexPath.row];
    
    //判断每行cell是否有要执行的操作
    if (item.operationBlock) {
        
        item.operationBlock(indexPath);
        
        return;
    }
    
    //判断是否是箭头类型的cell，如果是则跳转
    if ([item isKindOfClass:[FZQArrowItem class]] ) {
        FZQArrowItem *arrowItem = (FZQArrowItem *)item;
        
        //判断跳转block是否为空
        if(arrowItem.skipController){
        //不为空则跳转页面
        [self.navigationController pushViewController:[[arrowItem.skipController alloc]init] animated:YES];
        }
    }
}

// 返回每一组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    // 获取组模型
    FZQGroupItem *group = self.groups[section];
    
    return group.headerTitle;
}

// 返回每一组的脚部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 获取组模型
    FZQGroupItem *group = self.groups[section];
    
    return group.footerTitle;
}




@end
