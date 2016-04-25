//
//  FZQLotteryHallViewModel.m
//  lottery
//
//  Created by IMAC on 16/4/22.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryHallViewModel.h"
#import "FQHttpOperation.h"
#import "YYModel.h"
@implementation FZQLotteryHallViewModel
//获取最新的新闻
- (void)getLatestDatas {
    NSString *url =  @"http://api.caipiao.163.com//clientHall_hallInfoAll.html?mobileType=iphone";
    [FQHttpOperation getRequestWithURL:url parameters:nil success:^(id responseObject) {
        FZQLotteryHallModel *model = [FZQLotteryHallModel yy_modelWithJSON:responseObject];
        self.model = model;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatas" object:nil];
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatasFail" object:nil];
    }];
}
@end
