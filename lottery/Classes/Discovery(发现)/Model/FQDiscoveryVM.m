//
//  FQDiscoveryVM.m
//  lottery
//
//  Created by IMAC on 16/4/24.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FQDiscoveryVM.h"
#import "FQHttpOperation.h"

#import "YYModel.h"
@implementation FQDiscoveryVM
- (void)getLatestDatas
{
    NSString *url =  @"http://api.caipiao.163.com/lottery_newActivity_itemList.html";
    [FQHttpOperation getRequestWithURL:url parameters:nil success:^(id responseObject) {
        FQDiscoveryModel *model = [FQDiscoveryModel yy_modelWithJSON:responseObject];
        self.model = [self WebDiscovery2Discovery:model];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatas" object:nil];
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatasFail" object:nil];
    }];
}

- (NSArray *)WebDiscovery2Discovery:(FQDiscoveryModel *)_modelpara
{
    NSMutableArray *warray = [NSMutableArray array];
    NSMutableArray *tmparray = nil;
    for (NSObject *obj in _modelpara.backUpItems) {
        FQItmeDiscoveryModel *discovery = [FQItmeDiscoveryModel yy_modelWithJSON:obj];
        if(discovery.groupFlag)
        {
            if(tmparray)
                [warray addObject:tmparray];
            tmparray = [NSMutableArray array];
        }
        [tmparray addObject:obj];
        
    }
    [warray addObject:tmparray];
    return warray;
}
@end
