//
//  HttpOperation.h
//  HPYZhiHuDaily
//
//  Created by 洪鹏宇 on 15/11/5.
//  Copyright © 2015年 洪鹏宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFSecurityPolicy+XDPolicy.h"
@interface FQHttpOperation : NSObject

typedef void (^successBlock)(id responseObject);
typedef void (^failureBlock)(NSError *error);

+ (void)getRequestWithURL:(NSString *)URLString parameters:(nullable id)parameters success:(successBlock)success failure:(failureBlock)failure;


+ (void)postRequestWithURL:(NSString *)URLString parameters:(nullable id)parameters success:(successBlock)success failure:(failureBlock)failure;
@end
