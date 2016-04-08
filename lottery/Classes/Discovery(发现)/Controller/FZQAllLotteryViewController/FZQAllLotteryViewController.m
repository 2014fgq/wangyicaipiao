//
//  FZQAllLotteryViewController.m
//  lottery
//
//  Created by IMAC on 16/3/29.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQAllLotteryViewController.h"

#import "FZQAllLotteryButton.h"

@interface FZQAllLotteryViewController ()

@end

@implementation FZQAllLotteryViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 初始化导航条 */
    [self setUpNav];

}

/** 初始化导航条 */
-(void)setUpNav
{   
    /** 初始化导航条 */
    //设置中间按钮
    self.navigationItem.titleView = [self getBtn];
    
    //设置右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"助手" style:UIBarButtonItemStylePlain target:self action:@selector(assistant)];
    
    //初始化右边按钮颜色
    self.navigationItem.rightBarButtonItem.tintColor= [UIColor whiteColor];
   
}

/** 创建按钮 */
-(UIButton *)getBtn
{   
    /** 创建按钮 */
    //创建按钮
    UIButton *btn = [FZQAllLotteryButton buttonWithType:UIButtonTypeCustom];
    
    //设置文字
    [btn setTitle:@"全部彩种" forState:UIControlStateNormal];
    
    //设置图片
    [btn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    //按钮自适配
    [btn sizeToFit];
    
    //返回按钮
    return btn;
}

/* 助手 */
- (void)assistant
{
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

@end
