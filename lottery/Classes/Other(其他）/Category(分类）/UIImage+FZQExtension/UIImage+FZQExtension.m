//
//  UIImage+FZQExtension.m
//  图片拉伸
//
//  Created by apple on 15/6/23.
//  Copyright (c) 2015年 FZQ. All rights reserved.
//

#import "UIImage+FZQExtension.h"

@implementation UIImage (FZQExtension)

+ (instancetype)stretchableImageNamed:(NSString *)name
{
    //加载图片
    UIImage *bg = [self imageNamed:name];
    
    //返回伸缩保护后的图片
    return [bg stretchableImageWithLeftCapWidth:bg.size.width * 0.5 topCapHeight:bg.size.height * 0.5];
}
@end
