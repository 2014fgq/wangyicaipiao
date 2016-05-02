//
//  FZQArenaHV.m
//  lottery
//
//  Created by IMAC on 16/4/30.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import "FZQArenaHV.h"
@implementation FZQArenaHV
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)view
{
    if(!_view)
    {
        [self reloaddata];
        [self addSubview:self.view];
    }
    return _view;
}

- (void)reloaddata
{
    NSMutableArray *warray = [NSMutableArray array];
    for (FZQQuickNavigation *obj in self.header_model.quickNavigation) {
        SDDiscoverTableViewHeaderItemModel *model =
        [SDDiscoverTableViewHeaderItemModel modelWithTitle:obj.navName imageName:obj.picture destinationControllerClass:[UITableViewController class]];
        [warray addObject:model];
    }
    
    self.headerDataArray = warray;
    
    SDDiscoverTableViewHeader *header = [[SDDiscoverTableViewHeader alloc] init];
    header.h = 90;
    header.headerItemModelsArray = self.headerDataArray;
    __weak typeof(self) weakSelf = self;
    header.buttonClickedOperationBlock = ^(NSInteger index){
        SDDiscoverTableViewHeaderItemModel *model = weakSelf.headerDataArray[index];
        UIViewController *vc = [[model.destinationControllerClass alloc] init];
        vc.title = model.title;
        //        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    _view = header;
    [self addSubview:_view];
}

@end
