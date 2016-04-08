//
//  UIImage+FZQExtension.h
//  图片拉伸
//
//  Created by apple on 15/6/23.
//  Copyright (c) 2015年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XMGExtension)
/**
 *  返回一张可以拉伸的图片
 *
 *  @param name 图片名
 *
 *  @return 可以拉伸的图片
 */
+ (instancetype)stretchableImageNamed:(NSString *)imageName;
@end
