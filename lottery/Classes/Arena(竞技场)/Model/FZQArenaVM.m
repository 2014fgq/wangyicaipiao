//
//  FZQArenaVM.m
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaVM.h"
//@interface FZQArenaVM ()
//@dynamic model;
//@end


@implementation FZQArenaVM
@dynamic model;
@dynamic header_model;

- (void)getLatestDatas {
    NSString *url =  @"http://api.g.caipiao.163.com/homepage/list_goods.html?goodsType=all";
    [FQHttpOperation getRequestWithURL:url parameters:nil success:^(id responseObject) {
        FZQProductModel *model = [FZQProductModel yy_modelWithJSON:responseObject];
        self.model = model;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatas" object:nil];
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatasFail" object:nil];
    }];
}
//获取最新的数据
- (void)getLatestHeaderDatas {
    NSString *url =  @"http://api.g.caipiao.163.com/homepage/list_header.html";
    [FQHttpOperation getRequestWithURL:url parameters:nil success:^(id responseObject) {
        FZQArenaModel *model = [FZQArenaModel yy_modelWithJSON:responseObject];
        self.header_model = model;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestHeaderDatas" object:nil];
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestHeaderDatasFail" object:nil];
    }];
}
@end
