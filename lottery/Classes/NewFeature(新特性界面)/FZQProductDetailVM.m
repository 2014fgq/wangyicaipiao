//
//  FZQProductDetailVM.m
//  lottery
//
//  Created by IMAC on 16/5/8.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQProductDetailVM.h"

@implementation FZQProductDetailVM
@dynamic model;
@dynamic header_model;
- (void)getLatestDatas {
    FZQProductMainItemModel *model0 = [FZQProductMainItemModel modelWithTitle:@"图文详情" imageName:@"" jumpurl:@""];
    FZQProductMainItemModel *model1 = [FZQProductMainItemModel modelWithTitle:@"晒单分享" imageName:@"" jumpurl:@""];
    FZQProductMainItemModel *model2 = [FZQProductMainItemModel modelWithTitle:@"往期揭晓" imageName:@"" jumpurl:@""];
    
    FZQProductMainModel *model = [[FZQProductMainModel alloc] init];
    model.array = @[model0, model1, model2];
    self.model = model;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestDatas" object:nil];

}
//获取最新的数据
- (void)getLatestHeaderDatas {
    NSString *url =  @"http://api.g.caipiao.163.com/product_detail.html";
    NSDictionary *paradic = @{@"productId":@"2015102315PT00329355"};
    [FQHttpOperation postRequestWithURL:url parameters:paradic success:^(id  responseObject) {
        FZQProductDetailModel *model = [FZQProductDetailModel yy_modelWithJSON:responseObject];
        self.header_model = model;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestHeaderDatas" object:nil];
    } failure:^(NSError * error) {
        NSLog(@"%@", error);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getLatestHeaderDatasFail" object:nil];
    }];
    
    
}


@end
