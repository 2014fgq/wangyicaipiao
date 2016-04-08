//
//  FZQDiscoverViewController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQDiscoveryViewController.h"

#import "FZQAllLotteryViewController.h"

@implementation FZQDiscoveryViewController

#pragma mark - life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /** 跳转界面 */
    [self push];
}

/* 跳转界面 */
- (void)push
{
    //生成跳转控制器
    UIViewController *vc = [[FZQAllLotteryViewController alloc]init];
        
    //跳转界面
    [self.navigationController pushViewController:vc animated:YES];
}


@end
