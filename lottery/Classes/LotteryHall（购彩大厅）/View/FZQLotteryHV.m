//
//  FZQLotteryHV.m
//  lottery
//
//  Created by IMAC on 16/4/26.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryHV.h"

@implementation FZQLotteryHV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UILabel *)label
{
    if(!_label)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        _label = label;
        _label.tag = 1;
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return _label;
}

@end
