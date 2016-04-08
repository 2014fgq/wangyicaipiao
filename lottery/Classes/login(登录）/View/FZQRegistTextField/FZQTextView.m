//
//  FZQRegistView.m
//  registInterface
//
//  Created by IMAC on 16/3/13.
//  Copyright © 2016年 FZQ. All rights reserved.
//

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS


#import "FZQTextView.h"
#import "Masonry.h"

#define lblFont 19
#define textFont 19

@implementation FZQTextView

#pragma mark - 子控件生成、初始化、约束设置
/** 创建子控件 */
-(void)setUpView{
    //注册项目文本
    UILabel *label = [[UILabel alloc]init];
    self.label = label;
    [self addSubview:label];
    //输入文本框
    UITextField *textField = [[UITextField alloc]init];
    self.textField = textField;
    self.textField.delegate = self;//设置文本框代理
    [self addSubview:textField];
}

/** 初始化控件 */
-(void)setUp{
    
    
    /** 初始化子控件 */
    //注册项目文本
    self.label.textAlignment = NSTextAlignmentRight;
    self.label.font = [UIFont boldSystemFontOfSize:lblFont];
    //    self.label.layer.borderWidth = 1;
    //    self.label.layer.borderColor = [UIColor grayColor].CGColor;
    //    self.label.layer.cornerRadius = 15;
    
    //输入文本框
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.font = [UIFont boldSystemFontOfSize:textFont];
    self.textField.layer.borderWidth = 1;
    self.textField.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField.layer.cornerRadius = 10 ;
}

///** 设置约束 */
-(void)setConstraints
{
    //注册项目文本
    [self.label makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(20);
        make.top.equalTo(self.top).offset(1);
        make.bottom.equalTo(self.bottom).offset(-1);
        make.width.equalTo(50);
    }];
    //输入文本框
    [self.textField makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.label.right).offset(3);
        make.right.equalTo(self.right).offset(-20);
    }];
}

#pragma mark - 对象初始化方法
/** 类创建方法 */
+(id)TextView
{
    return [[self alloc]init];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        /** 创建子控件 */
        [self setUpView];
        
        /** 初始化子控件 */
        [self setUp];
        
        /** 增加约束 */
        [self setConstraints];
    }
    return self;
}




#pragma mark - <UITextFieldDelegate>
//拦截用户输入
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    return NO;
//}

//点击return时收回键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self endEditing:YES];
    return YES;
}

@end
