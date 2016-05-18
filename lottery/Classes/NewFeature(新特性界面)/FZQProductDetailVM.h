//
//  FZQProductDetailVM.h
//  lottery
//
//  Created by IMAC on 16/5/8.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryBaseVM.h"
#import "FZQProductDetailModel.h"
@interface FZQProductDetailVM : FZQLotteryBaseVM
@property (strong, nonatomic) FZQProductDetailModel *header_model;
@property (strong, nonatomic) FZQProductMainModel *model;
@end
