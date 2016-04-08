//
//  FZQLoginView.m
//  addressList
//
//  Created by IMAC on 16/3/14.
//  Copyright © 2016年 FZQ. All rights reserved.
//

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS


#import "FZQLoginView.h"
#import "Masonry.h"
#import "FZQOwl.h"

#define TEXTMARGIN 15
#define switchFont 17
@interface FZQLoginView ()<UITextFieldDelegate>

/** 动画控件 */
@property (nonatomic, weak) FZQOwl * owlView;
/** 注册界面 */
@property (nonatomic, weak) UIView * registView;

@end


@implementation FZQLoginView
#pragma mark - 生成控件与初始化
/** 创建子控件 */
-(void)setUpView{

    //动画控件
    FZQOwl *owlView = [FZQOwl owl];
    self.owlView = owlView;
    [self addSubview:owlView];
    
    //注册控件
    UIView *registView                   = [[UIView alloc]init];
    self.registView                      = registView;
    [self addSubview:registView];
    //账号文本
    FZQTextView *accountTextView = [FZQTextView TextView];
    self.accountTextView                = accountTextView;
    [registView addSubview:accountTextView];
    //密码文本
    FZQTextView *pwdTextView     = [FZQTextView TextView];
    self.pwdTextView                    = pwdTextView;
    [registView addSubview:pwdTextView];


    //开关控件
    //记住密码开关
    FZQSwitchView *pwdSwith              = [FZQSwitchView switchView];
    self.pwdSwith                        = pwdSwith;
    [self addSubview:pwdSwith];
    //自动登录开关
    FZQSwitchView *loginSwith            = [FZQSwitchView switchView];
    self.loginSwith                      = loginSwith;
    [self addSubview:loginSwith];

    //登录按钮
    UIButton *loginBtn                   =[[UIButton alloc]init];
    self.loginBtn                        = loginBtn;
    [self addSubview:loginBtn];

}

/** 初始化控件 */
-(void)setUp{
    /** 动画控件 */
    //让动画控件展示在前面
    [self bringSubviewToFront:self.owlView];
    
    /** 注册界面 */
    self.registView.backgroundColor        = [UIColor colorWithRed:1.0 green:0.6 blue:0.9 alpha:1.0];
    self.accountTextView.label.text = @"账号:";
    self.accountTextView.textField.placeholder = @"请输入账号";
    self.pwdTextView.label.text     = @"密码:";
    self.pwdTextView.textField.placeholder = @"请输入密码";
    self.pwdTextView.textField.secureTextEntry = YES;//设置暗文
    self.pwdTextView.textField.keyboardType = UIKeyboardTypeNumberPad;//设置数字键盘

    //设置清除按钮
    self.accountTextView.textField.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.pwdTextView.textField.clearButtonMode =UITextFieldViewModeWhileEditing;
        /** 设置监听及代理 */
    [self.accountTextView.textField addTarget:self action:@selector(keyin) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextView.textField addTarget:self action:@selector(keyin) forControlEvents:UIControlEventEditingChanged];
    self.pwdTextView.textField.delegate = self;
    
    /** 开关 */
    //记住密码开关
    self.pwdSwith.lbl.text                 = @"记住密码";
    self.pwdSwith.lbl.font                 = [UIFont systemFontOfSize:switchFont];
    //自动登录开关
    self.loginSwith.lbl.text               = @"自动登录";
    self.loginSwith.lbl.font               = [UIFont systemFontOfSize:switchFont];
    
    /** 登录按钮 */
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateDisabled];
    [self.loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

    
    //加载开关，登录按钮状态，文本框数据
    [self loadData];

}

/** 设置约束 */
-(void)setConstraints
{
    /** 动画约束 */ 
    [self.owlView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(55);
        make.right.equalTo(self.right).offset(-55);
        make.top.equalTo(self.top).offset(100);
        make.height.equalTo(110);
    }];

    /** 注册界面约束 */
    //注册界面（父控件）
    [self.registView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.owlView.left);
        make.right.equalTo(self.owlView.right);
        make.top.equalTo(self.owlView.bottom).offset(0);
        make.height.equalTo(110);
    }];
    //子控件——账号文本约束
    [self.accountTextView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.registView.width);
        make.top.equalTo(self.registView.top).offset(TEXTMARGIN);
        make.left.equalTo(self.registView.left);
    }];
    
    //子控件——密码文本约束
    [self.pwdTextView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountTextView.bottom).offset(TEXTMARGIN);
        make.left.equalTo(self.accountTextView.left);
        make.width.height.equalTo(self.accountTextView);
        make.bottom.equalTo(self.registView.bottom).offset(-TEXTMARGIN);
    }];

    /** 开关控件约束 */
    //记住密码开关约束
    [self.pwdSwith makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registView.left);
        make.top.equalTo(self.registView.bottom).offset(30);
        make.height.equalTo(31);
    }];
    //自动登录开关约束
    [self.loginSwith makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdSwith.top);
        make.left.equalTo(self.pwdSwith.right).offset(30);
        make.right.equalTo(self.registView.right);
        make.height.width.equalTo(self.pwdSwith);
    }];
    
    //登录按钮约束
    [self.loginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdSwith.bottom).offset(10);
        make.height.width.equalTo(50);
        make.centerX.equalTo(self.centerX);
    }];

}

#pragma mark - 类与对象创建方法
/** 对象初始化方法(手动代码） */
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        /********           创建子控件          ********/
        [self setUpView];
        
        /********           初始化控件          ********/
        [self setUp];
        
        /********           设置约束          ********/
        [self setConstraints];
            }
    return self;
}

/** 对象初始化方法(手动代码） */
-(void)awakeFromNib
{   
    [super awakeFromNib];
    /** 初始化控件 */
    [self setUp];
}

#pragma mark - 加载数据并设置状态
-(void)loadData
{
#warning saveTool应该怎么保存这些数据？也方便以后切换保存方式
    /** 加载开关状态 */
    self.pwdSwith.swt.on =[[NSUserDefaults standardUserDefaults]integerForKey:@"pwdOn"];
    self.loginSwith.swt.on =[[NSUserDefaults standardUserDefaults]integerForKey:@"autoLoginOn"];
    
    //判断开关状态
    if (self.pwdSwith.swt.on) {
        /** 获取账号密码信息 */
        self.accountTextView.textField.text  = [[NSUserDefaults standardUserDefaults]objectForKey:@"account"];
        self.pwdTextView.textField.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"pwd"];
        
        //根据文本框输入情况设置按钮状态
        [self keyin];
    }
}

/** 用户输入判断按钮状态 */
-(void)keyin
{
    if (self.accountTextView.textField.text.length && self.pwdTextView.textField.text.length) {
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
}

#pragma mark - <UITextFieldDelegate>
/** 用户输入密码时猫头鹰蒙眼 */
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.owlView openEyes:NO];
}

/** 用户结束输入密码时猫头鹰移开手 */
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.owlView openEyes:YES];
}


@end
