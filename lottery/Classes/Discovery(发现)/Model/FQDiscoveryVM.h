//
//  FQDiscoveryVM.h
//  lottery
//
//  Created by IMAC on 16/4/24.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FQDiscoveryModel.h"

@interface FQDiscoveryVM : NSObject
@property (strong, nonatomic) FQDiscoveryModel *model;

- (void)getLatestDatas;
@end
