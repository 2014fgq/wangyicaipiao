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

typedef void (^successBlock)(id _Nullable responseObject);
typedef void (^failureBlock)(NSError * _Nonnull error);

+ (void)getRequestWithURL:(NSString *_Nonnull)URLString parameters:(nullable id)parameters success:(nullable successBlock)success failure:(nullable failureBlock)failure;


+ (void)postRequestWithURL:(NSString *_Nonnull)URLString parameters:(nullable id)parameters success:(nullable successBlock)success failure:(nullable failureBlock)failure;
@end
