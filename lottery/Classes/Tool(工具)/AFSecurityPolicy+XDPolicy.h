//
//  AFSecurityPolicy+XDPolicy.h
//  tangchengyipin
//
//  Created by XiangDongMBP on 16/4/5.
//  Copyright © 2016年 XiangDong. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFSecurityPolicy (XDPolicy)

+ (instancetype)xd_sslDefaultPolicy;

@end
