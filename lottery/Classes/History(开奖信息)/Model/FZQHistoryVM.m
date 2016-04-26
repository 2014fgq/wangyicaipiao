//
//  FZQHistoryVM.m
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQHistoryVM.h"
#import "FQHttpOperation.h"
#import "YYModel.h"
@implementation FZQHistoryVM
- (void)getLatestDatas
{
    NSString *url =  @"http://api.caipiao.163.com/award_home.html";
    [FQHttpOperation getRequestWithURL:url parameters:nil success:^(id responseObject) {
        FZQHistoryModel *model = [FZQHistoryModel yy_modelWithJSON:responseObject];
        self.model = model;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatas" object:nil];
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatasFail" object:nil];
    }];
}
@end
