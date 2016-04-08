//
//  FZQLoginViewController.m
//  addressList
//
//  Created by IMAC on 16/3/14.
//  Copyright © 2016年 FZQ. All rights reserved.
//




#import "FZQLoginViewController.h"
#import "FZQLoginView.h"
#import "MBProgressHUD+XMG.h"



static FZQLoginView *lgView ;

@interface FZQLoginViewController ()


@end


@implementation FZQLoginViewController

#pragma mark - single
SINGLE_M(LoginViewController)



#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化控件
    [self setUpView];
}

//初始化控件
-(void)setUpView
{
    /** 创建view */
    self.view = [[FZQLoginView alloc]init];
    
    /** 初始化view */
    self.view.backgroundColor = [UIColor whiteColor];
    
    /** 设置导航栏 */
    self.navigationItem.title = @"登录页面";
    
    /** 设置登录按钮 */
    lgView = (FZQLoginView *)self.view;
    [lgView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    /** 设置开关 */
    [lgView.pwdSwith.swt addTarget:self action:@selector(savePwdOn:) forControlEvents:UIControlEventTouchDown];
    [lgView.loginSwith.swt addTarget:self action:@selector(autoLoginOn:) forControlEvents:UIControlEventTouchDown];
    
    //若自动登录开关打开则自动登录
//    if (lgView.loginSwith.swt.on) [self login];
}


#pragma mark - 开关方法设置
//记住密码
-(void)savePwd:(BOOL)isSave
{
#warning saveTool应该怎么保存这些数据？也方便以后切换保存方式
    //判断保存密码开关是否打开
    if(lgView.pwdSwith.swt.on == YES && isSave == YES){
        //若打开则归档账号密码信息
        [[NSUserDefaults standardUserDefaults]setObject:lgView.accountTextView.textField.text forKey:@"account"];
        [[NSUserDefaults standardUserDefaults]setObject:lgView.pwdTextView.textField.text forKey:@"pwd"];
    }else{
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"account"];
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"pwd"];
    }
}

//记住密码开关
-(void)savePwdOn:(UISwitch *)swt
{
    if (!swt.on) {
        //同时关闭自动登录开关
            [lgView.loginSwith.swt setOn:NO animated:YES];
        //清空账号密码信息
        [self savePwd:NO];
#warning saveTool应该怎么保存这些数据？也方便以后切换保存方式        
        //保存开关状态
        [[NSUserDefaults standardUserDefaults]setInteger:lgView.loginSwith.swt.on forKey:@"autoLoginOn"];
        [[NSUserDefaults standardUserDefaults]setInteger:swt.on forKey:@"pwdOn"];
    }else{
        //保存开关状态
        [[NSUserDefaults standardUserDefaults]setInteger:swt.on forKey:@"pwdOn"];
    }
}

//自动登录开关
-(void)autoLoginOn:(UISwitch *)swt
{
    if (swt.on) {
        //同时打开自动登录开关
            [lgView.pwdSwith.swt setOn:YES animated:YES];
        //保存开关状态
#warning saveTool应该怎么保存这些数据？也方便以后切换保存方式
        [[NSUserDefaults standardUserDefaults]setInteger:lgView.pwdSwith.swt.on forKey:@"pwdOn"];
        [[NSUserDefaults standardUserDefaults]setInteger:swt.on forKey:@"autoLoginOn"];
    }else{
        //保存开关状态
        [[NSUserDefaults standardUserDefaults]setInteger:swt.on forKey:@"autoLoginOn"];
    }
}


#pragma mark - 登录按钮方法设置
//点击登录跳转页码
-(void)login{
    
    //提示加载中
    [MBProgressHUD showMessage:@"小哥正在努力为你加载中" toView:self.view];
    
    //延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //收回挡板
        [MBProgressHUD hideHUDForView:self.view];
        
        //判断账号密码信息是否无误
        if ([lgView.accountTextView.textField.text isEqualToString:@"Fanzq"] && [lgView.pwdTextView.textField.text isEqualToString:@"123"]) {
            
            /** 保存账号密码 */
            [self savePwd:YES];
            
            //返回到上一个页面
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            //提示失败信息
            [MBProgressHUD showError:@"账号或密码有误"];
        }
    });
}

#pragma mark - 收回键盘
//点击其他地方收回键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
