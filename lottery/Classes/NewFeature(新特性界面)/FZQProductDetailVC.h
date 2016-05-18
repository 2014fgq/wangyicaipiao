//
//  FZQProductDetailVC.h
//  lottery
//
//  Created by IMAC on 16/5/8.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQBaseLotteryTableVC.h"
#import "FZQProductDetailVM.h"
@interface FZQProductDetailVC : FZQBaseLotteryTableVC
@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) FZQProductDetailVM *vm;
@end
