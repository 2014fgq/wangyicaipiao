//
//  FQDebug.h
//  lottery
//
//  Created by IMAC on 16/4/23.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQDebug : NSObject
@property (weak, nonatomic) UIApplication *app;
@property (weak, nonatomic) UIWindow *win;
@property (weak, nonatomic) UIViewController *rootVC;
+ (instancetype) shareDebug;
@end
