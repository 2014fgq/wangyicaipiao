//
//  FZQAllLotteryButton.m
//  lottery
//
//  Created by IMAC on 16/4/1.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQAllLotteryButton.h"

@implementation FZQAllLotteryButton

/** 布局子控件 */
-(void)layoutSubviews
{
    //调用父类方法
    [super layoutSubviews];
    
//    //只要label的位置在imageView的左面就不再交换位置
    if (self.titleLabel.x > self.imageView.x) {
        //交换label与图片的位置
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);

//        //设置图片位置模式
//        self.imageView.contentMode = UIViewContentModeCenter;
    }
    
}

@end
