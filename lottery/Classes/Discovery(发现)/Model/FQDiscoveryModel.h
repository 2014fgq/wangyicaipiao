//
//  FQDiscoveryModel.h
//  lottery
//
//  Created by IMAC on 16/4/24.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQDiscoveryModel : NSObject
@property (strong, nonatomic) NSArray *backUpItems;
@end

@interface FQItmeDiscoveryModel : NSObject
@property (strong, nonatomic) NSString *desc;
@property (assign, nonatomic) BOOL groupFlag;
@property (strong, nonatomic) NSString *jumpUrl;
@property (strong, nonatomic) NSString *logoUrl;
@property (strong, nonatomic) NSString *title;
@end
