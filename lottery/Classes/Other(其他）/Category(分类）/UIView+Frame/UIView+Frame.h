//
//  UIView+Frame.h
//  lottery
//
//  Created by IMAC on 16/3/29.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#warning 自动布局第三方框架与frame分类冲突,经典矛盾：frame与自动约束的爱恨情仇

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/** 生成set、get方法声明 */
@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat y;
@property(nonatomic,assign) CGFloat w;
@property(nonatomic,assign) CGFloat h;
//@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;

@end
