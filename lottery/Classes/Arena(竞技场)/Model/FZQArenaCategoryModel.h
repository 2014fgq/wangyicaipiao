//
//  FZQArenaCategoryModel.h
//  lottery
//
//  Created by IMAC on 16/5/4.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZQArenaCategoryModel : NSObject
@property (strong, nonatomic) NSArray *categoryList;
@end

@interface FZQArenaCategoryModelItem : NSObject
@property (strong, nonatomic) NSString *categoryId;
@property (strong, nonatomic) NSString *categoryImageUrl;
@property (strong, nonatomic) NSString *categoryName;
@end