//
//  FZQMyLotteryViewController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQMyLotteryViewController.h"

#import "FZQSettingViewController.h"

@implementation FZQMyLotteryViewController

#pragma mark - life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];

    /** 初始化导航条 */
    [self setUpNav];
}

/** 初始化导航条 */
-(void)setUpNav
{ 
    //左边按钮
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self getBtn]];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    //右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageNamed:@"Mylottery_config"] style:UIBarButtonItemStyleDone target:self action:@selector(setting)];

}

/** 创建按钮 */
- (UIButton *)getBtn
{   
    /** 创建按钮 */
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //设置文字
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    
    //设置图片
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    
    //按钮自适配
    [btn sizeToFit];
    
    //返回按钮
    return btn;
}

#pragma mark - skip
/** 跳转设置界面 */
- (void)setting
{
    //通过push跳转
    [self.navigationController pushViewController:[[FZQSettingViewController alloc]init] animated:YES];
}

/** 跳转登录界面 */
- (IBAction)login
{
    [self.navigationController pushViewController:[FZQLoginViewController shareLoginViewController] animated:YES];
}

@end
