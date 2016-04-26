//
//  FZQNavController.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQNavController.h"

#import "FZQHisSettingTableViewController.h"

@interface FZQNavController ()<UINavigationControllerDelegate>

/** 手势代理 */
@property (nonatomic, strong) id popDelegate;


@end

@implementation FZQNavController


/** 初始化类时统一对导航控制器设置 */
+(void)initialize
{
    // 当前类初始化的时候才会调用,子类调用时不初始化
    if (self == [FZQNavController class]) {
        
    //获取当前类下面所有导航条
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    //设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置文字颜色
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    navBar.titleTextAttributes = dictM;
    }
}
UIPanGestureRecognizer *popPan;
/** 跳转页面导航条设置 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //判断是不是导航控制器的根控制器
    if (self.childViewControllers.count != 0) {
        //设置导航条左边按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageNamed:@"NavBack"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        
        /** 跳转时隐藏标签栏 */
        viewController.hidesBottomBarWhenPushed = YES;
        
#if 0
        //局部手势，增加括号是为了收起代码
        {
        //局部手势
        //获取并记录手势代理
        self.popDelegate = self.interactivePopGestureRecognizer.delegate;
        
        //取消代理
        //手势执行的方法与代理是否清空无关。边缘手势要实现的效果就是执行手势代理中handleNavigationTransition：方法的效果。
        //对于手势或功能等，添加的target不一定是自己，所以action也不一定要是自己的方法。要看想实现什么功能
        self.interactivePopGestureRecognizer.delegate = nil;
        
        //设置代理
        self.delegate = self;
        }
#endif
       
        
#if 1   //全局手势，增加括号是为了收起代码
        {
        // 禁止使用系统自带的手势
        self.interactivePopGestureRecognizer.enabled = NO;
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector" //取消方法警告
//#pragma clang diagnostic ignored "-Wdeprecated-declarations"//取消声明警告
        //全局手势
        popPan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
#pragma clang diagnostic pop  
            
        //给控制器的view添加全局返回手势
        [viewController.view addGestureRecognizer:popPan];

    //手势与手势代理是在屏幕完全显示时才设置
    //程序创建时，加载所有导航控制器并没有完全显示屏幕，所以没有设置手势及手势代理
        }

#endif
    }   
    
    //执行系统的跳转方法
    [super pushViewController:viewController animated:animated];
}

/* 返回上一个界面 */
- (void)back
{
    [self popViewControllerAnimated:YES];
}

//局部手势代理需要实现下述方法
#if 0
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    屏幕完全显示时才设置手势代理，屏幕完全显示这个方法会调用两次
    NSLog(@"%@\n%@",self.interactivePopGestureRecognizer,self.interactivePopGestureRecognizer.delegate);
    
    //判断是不是根控制器
    if (self.childViewControllers.count == 1) {
        //恢复手势代理
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }
}
#endif

@end
