//
//  FZQLotteryBaseModel.h
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FQHttpOperation.h"
#import "YYModel.h"

@interface FZQLotteryBaseVM : NSObject
@property (strong, nonatomic) NSObject *model;
@property (strong, nonatomic) NSObject *header_model;
- (void)getLatestDatas;
- (void)getLatestHeaderDatas;
- (void)getLatestFooterDatas;
@end
