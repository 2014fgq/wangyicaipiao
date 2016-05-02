//
//  FZQLotteryHV.m
//  lottery
//
//  Created by IMAC on 16/4/26.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryHV.h"

@implementation FZQLotteryHV
- (UIView *)view
{
    if(!_view)
    {
        _view.backgroundColor = [UIColor whiteColor];
        
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"FZQSubLotteryHV" owner:self options:nil] lastObject];
        _view = view;
        [self addSubview:_view];
    }
    return _view;
}

@end
