//
//  FZQProductDetailModel.h
//  lottery
//
//  Created by IMAC on 16/5/8.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FZQProductItemModel;
@interface FZQProductDetailModel : NSObject
@property (strong, nonatomic) NSString *calculationDetailUrl ;
@property (strong, nonatomic) NSString *historyAwardUrl ;
@property (strong, nonatomic) FZQProductItemModel *product;
@end

@interface FZQProductItemModel : NSObject
@property (strong, nonatomic) NSString *awardNumber;
@property (strong, nonatomic) NSString *productDesc;
@property (strong, nonatomic) NSString *productId;
@property (strong, nonatomic) NSArray *productImages;
@property (strong, nonatomic) NSString *productName;
@property (assign, nonatomic) NSInteger *remainTimes;
@property (nonatomic) NSInteger totalTimes;
@property (strong, nonatomic) NSArray *timesList;
@end

@interface FZQProductMainModel : NSObject
@property (strong, nonatomic) NSArray *array;
@end

@interface FZQProductMainItemModel : NSObject
@property (strong, nonatomic) NSString *Productimg;
@property (strong, nonatomic) NSString *ProductName;
@property (strong, nonatomic) NSString *jumpurl;

+ (instancetype)modelWithTitle:(NSString *)ProductName imageName:(NSString *)Productimg jumpurl:(NSString *)jumpur;
@end