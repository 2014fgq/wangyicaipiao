//
//  AFSecurityPolicy+XDPolicy.m
//  tangchengyipin
//
//  Created by XiangDongMBP on 16/4/5.
//  Copyright © 2016年 XiangDong. All rights reserved.
//

#import "AFSecurityPolicy+XDPolicy.h"

@implementation AFSecurityPolicy (XDPolicy)

+ (instancetype)xd_sslDefaultPolicy {
    AFSecurityPolicy * sslDefaultPolicy = [AFSecurityPolicy defaultPolicy];
    sslDefaultPolicy.allowInvalidCertificates = YES;
    sslDefaultPolicy.validatesDomainName = NO;
    return sslDefaultPolicy;
}

@end
