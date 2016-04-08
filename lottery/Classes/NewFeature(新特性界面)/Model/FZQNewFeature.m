//
//  FZQNewFeature.m
//  lottery
//
//  Created by IMAC on 16/4/1.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQNewFeature.h"

@implementation FZQNewFeature

/** 类创建方法 */
+(instancetype)newFeatureWithDict:(NSDictionary *) dict
{
    return [[self alloc]initWithDict:dict];
}

/** 对象创建方法 */
-(instancetype)initWithDict:(NSDictionary *) dict
{
    if (self = [super init]) {
        //字典转模型
        self.backgroundIcon = [self setImage:dict[@"backgroundIcon"]];
        
        self.icon = [self setImage:dict[@"icon"]];
        
        self.largeTextImage = [self setImage:dict[@"largeTextImage"]];
        
        self.smallTextImage = [self setImage:dict[@"smallTextImage"]];
    }
    return self;
}

/* 生成图片 */
- (UIImage *)setImage:(NSString *)imageName
{
    //返回不耗内存加载的图片
//    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"png"]];
    
    //返回耗内存加载的图片
    return [UIImage imageNamed:imageName];
}

@end
