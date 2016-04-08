//
//  FZQTabBarController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQTabBarController.h"

#import "FZQNavController.h"

#import "FZQLotteryHallViewController.h"

#import "FZQArenaViewController.h"

#import "FZQDiscoveryViewController.h"

#import "FZQHistoryViewController.h"

#import "FZQMyLotteryViewController.h"

#import "FZQArenaNavController.h"

#import "FZQTabBar.h"


@interface FZQTabBarController ()

/** items */
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation FZQTabBarController

#pragma mark - lazy load
-(NSArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 添加所有子控制器 */
    [self setUpAllChildViewController];
    
    /** 初始化自定义tabBar */
    [self setUpTabBar];
}

/** 系统即将显示时移除tabBar中的button */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];    
    
    //遍历系统的tabBar
    for (UIView *childView in self.tabBar.subviews) {
        
        if ([childView isKindOfClass:[FZQTabBar class]] == NO) {
            //如果不是自定义的tabBar,将所有系统按钮移除
            [childView removeFromSuperview];
        }
    }
}

/** 初始化自定义tabBar */
-(void)setUpTabBar
{   
    /** 初始化自定义tabBar */
    FZQTabBar *newTabBar = [[FZQTabBar alloc]initWithFrame:self.tabBar.bounds];

    //设置自定义tabBar items内容
    newTabBar.items = self.items;
    
    //设置自定义tabBar跳转block
    //用弱指针指向tabBarVc,避免循环引用
    __weak typeof(self) weakSelf = self;
    
    //设置block
    newTabBar.tabBarBlock = ^(NSInteger selectedIndex) {
        //根据选中跳转页面
        weakSelf.selectedIndex = selectedIndex;
    };
    
    //添加到系统tabBar中
    [self.tabBar addSubview:newTabBar];
}

#pragma mark - 添加所有子控制器
/* 添加所有子控制器 */
- (void)setUpAllChildViewController
{
    //购彩大厅
    [self setUpOneChildViewController:[FZQLotteryHallViewController class] title:@"购彩大厅"];
    
    //竞技场
    [self setUpOneChildViewController:[FZQArenaViewController class] title:@"竞技场"];
    
    //发现
    [self setUpOneChildViewController:[FZQDiscoveryViewController class] title:@"发现"];
    
    //开奖信息
    [self setUpOneChildViewController:[FZQHistoryViewController class] title:@"开奖信息"];
    
    //我的彩票
    [self setUpOneChildViewController:[FZQMyLotteryViewController class] title:@"我的彩票"];
    
}

/** 添加一个子控制器 */
- (void)setUpOneChildViewController:(Class)viewControllerClass title:(NSString *)title
{
    //生成控制器
    UIViewController *vc;
    
    //判断是否是“发现”控制器类
    if (viewControllerClass == [FZQDiscoveryViewController class] == YES) {
        //生成storyboard
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([viewControllerClass class]) bundle:nil];
        
        //设置控制器为storyboard指向的控制器
        vc = [storyboard instantiateInitialViewController];
    }else{
        
        //直接生成控制器
        vc = [[viewControllerClass alloc]init];
    }
    
    //生成导航控制器
    UINavigationController *nav;
    
    //判断是否是竞技场控制器类,使用不同的导航控制器
    if([vc isKindOfClass:[FZQArenaViewController class]] == YES){
        
        //如果是竞技场，使用自有的导航控制器
        nav = [[FZQArenaNavController alloc]initWithRootViewController:vc];
    }else{
        
        //如果不是竞技场，使用公用的导航控制器
        nav = [[FZQNavController alloc]initWithRootViewController:vc]; 
    }
    
    //设置导航条title
    vc.navigationItem.title = title;
    
    /* 生成并设置item，并加入到items */
    [self setUpItem:viewControllerClass];
    
    //将导航控制器加入到标签控制器
    [self addChildViewController:nav];
}

#pragma mark - 设置UITabBarItem
/* 生成并设置item，并加入到items */
- (void)setUpItem:(id)className
{
    //截取字符串
    NSString *tempStr = [self getString:className];
    
    //生成item
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage originalImageNamed:[NSString stringWithFormat:@"TabBar_%@_new",tempStr]] selectedImage:[UIImage originalImageNamed:[NSString stringWithFormat:@"TabBar_%@_selected_new",tempStr]]];
    
    //加入到items中
    [self.items addObject:item];
}

#pragma mark - getString
/* 截取字符串 */
- (NSMutableString *)getString:(id)className
{
    /** 截取字符串 */
    NSMutableString *tempStr = [NSMutableString stringWithFormat:@"%@",NSStringFromClass([className class])];
    //删除类前缀
    NSRange range = [tempStr rangeOfString:@"FZQ"];
    [tempStr deleteCharactersInRange:range];
    //删除控制器后缀名
    range = [tempStr rangeOfString:@"ViewController"];
    [tempStr deleteCharactersInRange:range];
    
    return tempStr;
}
@end
