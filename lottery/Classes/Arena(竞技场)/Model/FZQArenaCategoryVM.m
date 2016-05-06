//
//  FZQFZQArenaCategoryVM.m
//  lottery
//
//  Created by IMAC on 16/5/4.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaCategoryVM.h"

@implementation FZQArenaCategoryVM
@dynamic model;
- (void)getLatestDatas
{
    NSString *url =  @"http://api.g.caipiao.163.com//category/category_list.html?product=caipiao_client";
    [FQHttpOperation getRequestWithURL:url parameters:nil success:^(id responseObject) {
        FZQArenaCategoryModel *model = [FZQArenaCategoryModel yy_modelWithJSON:responseObject];
        self.model = model;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatas" object:nil];
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatasFail" object:nil];
    }];
}
@end
