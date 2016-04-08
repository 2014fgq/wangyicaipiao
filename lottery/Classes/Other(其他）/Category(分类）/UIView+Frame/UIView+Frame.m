//
//  UIView+Frame.m
//  lottery
//
//  Created by IMAC on 16/3/29.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - x set、get方法实现
-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

#pragma mark - y set、get方法实现
-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

#pragma mark - width set、get方法实现
//-(void)setWidth:(CGFloat)width
//{
//    CGRect bounds = self.bounds;
//    bounds.size.width = width;
//    self.frame = bounds;
//}
//
//-(CGFloat)width
//{
//    return self.bounds.size.width;
//}

#pragma mark - height set、get方法实现
-(void)setHeight:(CGFloat)height
{
    CGRect bounds = self.bounds;
    bounds.size.height = height;
    self.bounds = bounds;
}

-(CGFloat)height
{
    return self.bounds.size.height;
}

//#pragma mark - centerX set、get方法实现
//-(void)setCenterX:(CGFloat)centerX
//{
//    CGPoint center = self.center;
//    center.x = centerX;
//    self.center = center;
//}
//
//-(CGFloat)centerX
//{
//    return self.center.x;
//}
//
#pragma mark - centerY set、get方法实现
-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.x = centerY;
    self.center = center;
}

-(CGFloat)centerY
{
    return self.center.y;
}

@end
