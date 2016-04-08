//
//  UIImage+OriginalImage.m
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "UIImage+OriginalImage.h"

@implementation UIImage (OriginalImage)

/** 返回不加渲染的图片 */
+(instancetype)originalImageNamed:(NSString *)imageName{
    //加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    
    //返回不加渲染的图片
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end

