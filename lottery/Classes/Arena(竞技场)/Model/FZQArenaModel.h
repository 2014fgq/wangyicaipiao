//
//  FZQArenaModel.h
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZQArenaModel : NSObject
@property (strong, nonatomic) NSArray *quickNavigation;
@property (strong, nonatomic) NSArray *productTabs;
@property (strong, nonatomic) NSArray *adInfos;
@end

@interface FZQQuickNavigation : NSObject
@property (strong, nonatomic) NSString *clickUrl;
@property (strong, nonatomic) NSString *navName;
@property (strong, nonatomic) NSString *picture;
@end

@interface FZQProductTabs : NSObject
@property (strong, nonatomic) NSString *categoryId;
@property (strong, nonatomic) NSString *showAlertTime;
@property (strong, nonatomic) NSString *title;
@end

@interface FZQAdInfos : NSObject
@property (strong, nonatomic) NSString *clickUrl;
@property (strong, nonatomic) NSString *picture;
@end


@interface FZQProductModel : NSObject
@property (strong, nonatomic) NSArray *productList;
@property (nonatomic) NSInteger maxPage;
@end

@interface FZQItemProductList : NSObject
@property (nonatomic) NSInteger defaultTimes;
@property (nonatomic) NSInteger minTimes;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productUrl;
@property (nonatomic) NSInteger remainTimes;
@property (nonatomic) NSInteger totalTimes;
@end
