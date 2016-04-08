//
//  FZQNewFeature.h
//  lottery
//
//  Created by IMAC on 16/4/1.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FZQNewFeature : NSObject

/** 背景图片 */
@property (nonatomic, strong) UIImage *backgroundIcon;
/** 图片 */
@property (nonatomic, strong) UIImage *icon;
/** 大文本图片 */
@property (nonatomic, copy) UIImage * largeTextImage;
/** 大文本图片 */
@property (nonatomic, copy) UIImage * smallTextImage;

/** 类创建方法 */
+(instancetype)newFeatureWithDict:(NSDictionary *) dict;
@end

