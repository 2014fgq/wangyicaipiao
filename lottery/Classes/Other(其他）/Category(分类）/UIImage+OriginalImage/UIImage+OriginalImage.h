//
//  UIImage+OriginalImage.h
//  lottery
//
//  Created by IMAC on 16/3/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OriginalImage)


/** 返回不加渲染的图片 */
+(instancetype)originalImageNamed:(NSString *)imageName;
@end
