//
//  FZQLotteryBaseHV.m
//  lottery
//
//  Created by IMAC on 16/4/30.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQLotteryBaseHV.h"

@implementation FZQLotteryBaseHV

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = BACKGROUPCOLOR;
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (GGBannerView *)bannerView
{
    if(!_bannerView)
    {
        //合入头部图片滚动功能
        GGBannerView *bannerView = [[GGBannerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, LOTTERY_HEADERVIEWHEIGH)];
        self.bannerView = bannerView;
        [self addSubview:self.bannerView];
        
    }
    return _bannerView;
}

@end
