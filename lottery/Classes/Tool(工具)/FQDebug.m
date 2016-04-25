


//
//  FQDebug.m
//  lottery
//
//  Created by IMAC on 16/4/23.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FQDebug.h"
//[UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0].childViewControllers.vm.model

//po [[UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0].childViewControllers[0] performSelector:@selector(testCalcNullData)]
@implementation FQDebug
static FQDebug *debug = nil;
+ (instancetype) shareDebug
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        debug = [[FQDebug alloc] init];
        debug.app = [UIApplication sharedApplication];
        debug.win = debug.app.keyWindow;
        debug.rootVC = debug.app.keyWindow.rootViewController;
        [debug debug];
    });
    return debug;
}

- (void) debug
{
    
}

@end

