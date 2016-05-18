//
//  FZQHistoryTableHV.m
//  lottery
//
//  Created by IMAC on 16/5/6.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQHistoryTableHV.h"

@implementation FZQHistoryTableHV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //这里添加子控件
        [self initSubView];
        [self setup];
    }
    return self;
}

- (void)initSubView
{
    self.backgroundColor = BACKGROUPCOLOR;
    
    self.titlelabel.text  = [NSString stringWithFormat:@"%d亿%d万", 100, 2896];
    self.titlelabel.textAlignment = NSTextAlignmentCenter;
    
    self.detaillabel.text = @"网易彩票累计中奖金额";
    self.detaillabel.textAlignment = NSTextAlignmentCenter;
    self.detaillabel.font = [UIFont fontWithName:@"Helvetica" size:8];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

-(void)setup{
    // 设置约束
    
    //高占比55%
    self.titlelabel.sd_layout
    .leftSpaceToView(self,0)
    .topSpaceToView(self,self.h*0.05)
    .widthIs(self.w)
    .heightIs(self.h*0.5);
    
    //高占比40%
    self.detaillabel.sd_layout
    .leftSpaceToView(self,0)
    .topSpaceToView(self.titlelabel,self.h*0.1)
    .widthIs(self.w)
    .heightIs(self.h*0.3);
    
    [self setupAutoHeightWithBottomView:self.detaillabel bottomMargin:self.h*0.1];
}

UILAZY(titlelabel, UILabel)
UILAZY(detaillabel, UILabel)
@end
