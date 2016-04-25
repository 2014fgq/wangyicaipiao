//
//  FZQTabBar.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQTabBar.h"

@interface FZQTabBar ()

/** 选中按钮 */
@property (nonatomic, weak) UIButton * selectedBtn;

@end


@implementation FZQTabBar

-(void)setItems:(NSArray*)items
{
    //赋值
    _items = items;
    
    //取出里面的item
    for (int i = 0 ;i<self.items.count;i++) {
        
        //取出item
        UITabBarItem *item = self.items[i];

        //生成按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //设置常规背景图片
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        
        //设置选择背景图片
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        //高度时不调整图片
        btn.adjustsImageWhenHighlighted = NO;
        
        //绑定tag值
        btn.tag = i;
        
        if (i == 0) {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
        
        //为按钮增加方法
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //加入控件中
        [self addSubview:btn];
    }
}
 
/* 按钮点击 */
- (void)btnClick:(UIButton *)btn
{
    //取消上一个按钮选中
    self.selectedBtn.selected = NO;
    
    //设置按钮选中
    btn.selected = YES;
    
    //记录选中按钮
    self.selectedBtn = btn;
    
    //设置跳转
    self.tabBarBlock(btn.tag);
}

/** 布局子控件 */    
-(void)layoutSubviews
{
    //调用系统layoutSubviews
    [super layoutSubviews];
    
    //定义变量
    CGFloat btnX;
    CGFloat btnY = 0;
    CGFloat btnW = SCREEN_WIDTH / self.subviews.count;
    CGFloat btnH = self.h;
    int i = 0;
    
    for (UIButton *btn in self.subviews) {
        
        //设置每个按钮的btnX值
        btnX = btnW * i;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        i++;
    }
}


@end
