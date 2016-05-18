//
//  FZQProductDetailModel.m
//  lottery
//
//  Created by IMAC on 16/5/8.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQProductDetailModel.h"

@implementation FZQProductDetailModel

@end

@implementation FZQProductItemModel

@end

@implementation FZQProductMainModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"array" : [FZQProductMainItemModel class]};
}
@end

@implementation FZQProductMainItemModel
+ (instancetype)modelWithTitle:(NSString *)ProductName imageName:(NSString *)Productimg jumpurl:(NSString *)jumpur
{
    FZQProductMainItemModel *model = [[FZQProductMainItemModel alloc] init];
    model.ProductName = ProductName;
    model.Productimg = Productimg;
    model.jumpurl = jumpur;
    return model;
}
@end
