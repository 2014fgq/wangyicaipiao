//
//  FZQArenaViewController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaViewController.h"

@implementation FZQArenaViewController

#pragma mark - life cycle
-(void)loadView
{
    //加载图片
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    
    //设置主视图
    self.view = [[UIImageView alloc]initWithImage:image];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    /** 初始化导航条 */
    [self setUpNav];
}

/** 初始化导航条 */
-(void)setUpNav
{  
    /** 初始化导航条 */
    //生成选项按钮
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"足球",@"篮球"]];
    
    //设置正常背景图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //设置选中背景图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

    //默认选中第一个按钮
    seg.selectedSegmentIndex = 0;
   
    //设置主题颜色
    seg.tintColor = RGBACOLOR(0, 142,143, 1);
    
    //设置选中时文字颜色
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    //设置导航条标题控件
    self.navigationItem.titleView = seg;
}

@end
