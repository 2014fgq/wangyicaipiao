//
//  FZQArenaVM.h
//  lottery
//
//  Created by IMAC on 16/4/28.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FZQArenaModel.h"
#import "FZQLotteryBaseVM.h"
@interface FZQArenaVM : FZQLotteryBaseVM
@property (strong, nonatomic) FZQProductModel *model;
@property (strong, nonatomic) FZQArenaModel *header_model;

- (void)getLatestDatasByID:(NSString *)categoryId;
@end

///Users/imac/Public/git/lottery/lottery/Classes/Arena(竞技场)/Model/FZQArenaVM.h:13:48: Auto property synthesis will not synthesize property 'model'; it will be implemented by its superclass, use @dynamic to acknowledge intention
