//
//  FZQLoginViewController.h
//  addressList
//
//  Created by IMAC on 16/3/14.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Single.h"

@interface FZQLoginViewController : UIViewController

#warning 让一个控制器成为单例不太合适。。。
/** 单例 */
SINGLE_H(LoginViewController)

@end
