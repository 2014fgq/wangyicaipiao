//
//  HttpOperation.m
//  HPYZhiHuDaily
//
//  Created by 洪鹏宇 on 15/11/5.
//  Copyright © 2015年 洪鹏宇. All rights reserved.
//

#import "FQHttpOperation.h"

@implementation FQHttpOperation

//+ (void)getRequestWithURL:(NSString *)URLString parameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure {
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kbaseURL]];
//    [manager GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}

+ (void)getRequestWithURL:(NSString *)URLString parameters:(nullable id)parameters success:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy xd_sslDefaultPolicy];
    //[manager.requestSerializer setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success) {
           success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure) {
            failure(error);
        }
    }];
}

+ (void)postRequestWithURL:(NSString *)URLString parameters:(nullable id)parameters success:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy xd_sslDefaultPolicy];
//    [manager.requestSerializer setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    // 防止自动将data的特殊符号转义
//    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
//        return (NSString *)parameters;
//    }];
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end