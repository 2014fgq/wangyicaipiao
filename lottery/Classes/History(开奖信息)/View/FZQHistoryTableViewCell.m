//
//  FZQHistoryTableViewCell.m
//  lottery
//
//  Created by IMAC on 16/4/25.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQHistoryTableViewCell.h"

@implementation FZQHistoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//自定义单元格
+ (instancetype)CellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"History_cell";
    FZQHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[FZQHistoryTableViewCell alloc] initWithReuseIdentifier:ID];
    }
    //设置cell的属性
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//重写initWithReuseIdentifier方法，在创建cell的时候，同时创建子控件
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        //在这里加上子控件的代码
        [self setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setModel:(FZQHistorySubModel *)model
{
//    self.textLabel.text = [self datamap:model.gameEn];
//    self.detailTextLabel.text = model.awardTime;
//    self.detailTextLabel.textColor = [UIColor grayColor];
    _model = model;
    
    self.titleLabel.text = [self datamap:model.gameEn];
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    
    self.subtitleLabel.text = model.awardTime;
    self.subtitleLabel.textColor = [UIColor grayColor];
    self.subtitleLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
    
    [self.subviews enumerateObjectsUsingBlock:^(BallView *view, NSUInteger idx, BOOL *stop) {
        [self.view removeFromSuperview];
        self.view = nil;
    }];
//    self.view.backgroundColor = [UIColor blackColor];
    NSArray *list = [model.awardNo componentsSeparatedByString:@" "];
    if([list[0] length] == 2)
    {
            BallView *view = [[BallView alloc] initWithFrame:CGRectMake(self.w*0.05, self.h*0.6, SCREEN_WIDTH, self.h*0.4)];
            [view setHeaderItemModelsArray:list];
            self.view = view;
            [self addSubview:self.view];
    }
    else
    {
        [self.subviews enumerateObjectsUsingBlock:^(BallView *view, NSUInteger idx, BOOL *stop) {
            [self.view removeFromSuperview];
            self.view = nil;
        }];

    }
}

- (void)setup
{
    //高占比30%
    self.titleLabel.sd_layout
    .leftSpaceToView(self, self.w*0.05)
    .topSpaceToView(self, self.h*0.1)
    .widthIs(self.w*0.25)
    .heightIs(self.h*0.2);
    
    // 设置约束
    //高占比30
    self.subtitleLabel.sd_layout
    .leftSpaceToView(self.titleLabel, 10)
    .topSpaceToView(self, self.h*0.1)
    .widthIs(self.w*0.8)
    .heightIs(self.h*0.2);
    //    .autoHeightRatio(0);
    
//    //高占比50%
//    self.view.sd_layout
//    .leftEqualToView(self.titleLabel)
//    .topSpaceToView(self.titleLabel, self.h*0.1)
//    .widthIs(self.w)
//    .heightIs(self.h*0.6);
//    .autoHeightRatio(0);
    
//    [self setupAutoHeightWithBottomView:self.view bottomMargin:self.h*0.05];
}

- (NSString *)datamap:(NSString *)str
{
    NSDictionary *dict = @{@"ssq"        : @"双色球",
                           @""       : @"竞彩篮球",//
                           @""       : @"快乐扑克",//
                           @"football_9" : @"胜负彩/任选九",
                           @"football_sfc" : @"胜负彩/任选九",
                           @"ssc"        : @"重庆时时彩",
                           @"qxc"        : @"七星彩",
                           @""       : @"竞彩足球",//
                           @"d11"        : @"11选5",
                           @"gdd11"      : @"粤11选5",
                           @"jxd11"      : @"老11选5",
                           @""           : @"重庆11选5",//
                           @"lnd11"      : @"辽宁11选5",
                           @"hljd11"     : @"好运11选5",
                           @"zjd11"      : @"易乐11选5",
                           @"gxkuai3"    : @"新快3",
                           @"oldkuai3"   : @"江苏快3",
                           @"hbkuai3"    : @"湖北快3",
                           @"kuai3"      : @"快3",
                           @"ahkuai3"    : @"好运快3",
                           @"nmgkuai3"   : @"易快3",
                           @"dlt"        : @"大乐透",
                           @"x3d"        : @"3D",
                           @"jxssc"      : @"新时时彩",
                           @""           : @"足球单场",//
                           @"kl10"       : @"粤快乐十分",
                           @""           : @"胜负过关",//
                           @"kl8"        : @"快乐8",
                           @"qlc"        : @"七乐彩",
                           @""           : @"排列5", //
                           @"pl3"        : @"排列3",
                           //
//                           @"football_f4cjq" : @"",
//                           @"feiyu"      : @"",
//                           @"football_bqc" : @"",
//                           @"klpk"       : @"",
                           
                           };
    
    if([dict valueForKey:str])
    {
        return dict[str];
    }
    else
    {
        return str;
    }
}

UILAZY(titleLabel, UILabel)
UILAZY(subtitleLabel, UILabel)
//UILAZY(view, UIView)
@end

@implementation BallView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setHeaderItemModelsArray:(NSArray *)headerItemModelsArray
{
    self.array = headerItemModelsArray;
    
    [_array enumerateObjectsUsingBlock:^(NSString *text, NSUInteger idx, BOOL *stop){
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor redColor];
        label.text = text;
        //配置圆角
        [label.layer setBorderWidth:1.0];
        [label.layer setBorderColor:[UIColor redColor].CGColor];
        label.layer.cornerRadius = 20/2;
        label.layer.masksToBounds = true;
        
        //配置内容
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontWithName:@"Helvetica" size:12];
//        self.label.backgroundColor = [UIColor colorWithHex:0x44566A];
        
        [self addSubview:label];
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.subviews.count == 0) return;
//    CGFloat w = self.w / self.subviews.count;
    CGFloat w = 20;
    CGFloat h = 20;
    [self.subviews enumerateObjectsUsingBlock:^(UIView *label, NSUInteger idx, BOOL *stop) {
        label.frame = CGRectMake(idx * 1.2 * w, 0, w, h);
    }];
}
@end
