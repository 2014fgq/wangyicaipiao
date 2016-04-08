//
//  FZQOwl.m
//  addressList
//
//  Created by IMAC on 16/3/16.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQOwl.h"

@interface FZQOwl()

/** 左手 */
@property (weak, nonatomic) IBOutlet UIImageView *leftHand;
/** 右手 */
@property (weak, nonatomic) IBOutlet UIImageView *rightHand;
/** 左臂 */
@property (weak, nonatomic) IBOutlet UIImageView *leftArm;
/** 右臂 */
@property (weak, nonatomic) IBOutlet UIImageView *rightArm;
/** 裁剪屏 */
@property (weak, nonatomic) IBOutlet UIView *clipView;

/** 左移X */
@property (nonatomic, assign) CGFloat leftX;
/** 左移Y */
@property (nonatomic, assign) CGFloat leftY;
/** 右移X */
@property (nonatomic, assign) CGFloat rightX;
/** 右移Y */
@property (nonatomic, assign) CGFloat rightY;

@end



@implementation FZQOwl

#pragma mark - 创建与初始化
/** 类创建方法 */
+(id)owl
{
    FZQOwl *owlView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
    return owlView;
}

//初始化
-(void)awakeFromNib
{
    /** 计算偏移 */
    //左臂、左手移动距离
    self.leftX = - self.leftArm.frame.origin.x ;
    
    self.leftY = self.clipView.frame.size.height - self.leftArm.frame.origin.y;
    
    //右臂、左右移动距离
    self.rightX = self.clipView.frame.size.width - self.rightHand.frame.size.width -  self.rightArm.frame.origin.x ;
    
    self.rightY = self.clipView.frame.size.height - self.rightArm.frame.origin.y;
    
    /** 初始化左臂及右臂位置 */
    //设置左臂偏移
    self.leftArm.transform = CGAffineTransformMakeTranslation(self.leftX, self.leftY);
    
    /** 右臂 */
    //设置右臂偏移
    self.rightArm.transform = CGAffineTransformMakeTranslation(self.rightX, self.rightY);
}

#pragma mark - 睁眼闭眼动画
/** 睁（蒙）眼动画 */
-(void)openEyes:(BOOL)isOpen
{
    if (isOpen) {
        /** 动画偏移 */
        [UIView animateWithDuration:.5 animations:^{
            /** 左臂 */
            //设置左臂偏移
            self.leftArm.transform = CGAffineTransformMakeTranslation(self.leftX, self.leftY);
            
            /** 右臂 */
            //设置右臂偏移
            self.rightArm.transform = CGAffineTransformMakeTranslation(self.rightX, self.rightY);
            
            /** 左手复位 */
            self.leftHand.transform = CGAffineTransformIdentity;//所有形变清零
            
            /** 右手复位 */
            self.rightHand.transform = CGAffineTransformIdentity;
        }];
    }else{
        /** 动画偏移 */
        [UIView animateWithDuration:.5 animations:^{
            //设置左臂复位
            self.leftArm.transform = CGAffineTransformIdentity;
            
            //设置右臂复位
            self.rightArm.transform = CGAffineTransformIdentity;
            
            //设置左手偏移,缩小
            self.leftHand.transform = CGAffineTransformMakeTranslation(-self.leftX, -self.leftY+20);
            self.leftHand.transform = CGAffineTransformScale(self.leftHand.transform, 0.01, 0.01);
            
            //设置右手偏移,缩小
            self.rightHand.transform = CGAffineTransformMakeTranslation(-self.rightX, -self.rightY+20);
            self.rightHand.transform = CGAffineTransformScale(self.rightHand.transform, 0.01, 0.01);
        }];
    }
}
@end
