//
//  FZQLotteryHallModel.h
//  lottery
//
//  Created by IMAC on 16/4/21.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FQCard;
@class FQAdInfo;
@interface FZQLotteryHallModel : NSObject
@property (strong, nonatomic) NSArray *adInfo;
@property (strong, nonatomic) NSArray *cardList;
@property (strong, nonatomic) NSArray *layout;
@property (strong, nonatomic) NSString *version;
@end

@interface FQAdInfo : NSObject
@property (strong, nonatomic) NSString *clickHref;
//@property (strong, nonatomic) NSString *newPicture;
@property (strong, nonatomic) NSString *picture;
@end

@interface FQSubAttribute : NSObject
@property (strong, nonatomic) NSString *activityColor;
@property (strong, nonatomic) NSString *activityText;
@property (strong, nonatomic) UIColor *activityTextColor;
@property (strong, nonatomic) UIImage *badgeIcon;
@property (strong, nonatomic) NSString *cardDesc;
@property (strong, nonatomic) NSString *cardName;
@property (strong, nonatomic) NSString *logo;
@property (assign, nonatomic) NSInteger *rankMax;
@property (assign, nonatomic) NSInteger *rankMin;
@property (strong, nonatomic) NSString *shiftLeft;
@end

@interface FQCard : NSObject
@property (strong, nonatomic) FQSubAttribute *attribute;
@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *type;
@end

@interface FQLayout: NSObject
@property (strong, nonatomic) NSString *cardId;
@property (strong, nonatomic) NSArray *childCardList;
@end
