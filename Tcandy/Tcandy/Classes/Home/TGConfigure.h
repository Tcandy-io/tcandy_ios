//
//  TGConfigure.h
//  Tcandy
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//


#ifndef TGConfigure_h
#define TGConfigure_h

#import "TGNetwork.h"
//字体颜色
#define kTGTextColorRed  [UIColor colorWithRed:235/255.0f green:35/255.0f blue:123/255.0f alpha:1]
#define kTGTextColorGray  [UIColor colorWithRed:100/255.0f green:100/255.0f blue:100/255.0f alpha:1]
#define kTGStatusBarHeight (([[UIScreen mainScreen] bounds].size.height == 812.0) ? 44.0:20.0)
//
#define kTGSafeAreaTop  ((([[UIScreen mainScreen] bounds].size.height == 812.0)) ?  88.0 : 64.0)
#define kTGSafeAreaTabBarBottom  ((([[UIScreen mainScreen] bounds].size.height == 812.0)) ?  83.0 : 49.0)
#define kTGSafeAreaBottom  ((([[UIScreen mainScreen] bounds].size.height == 812.0)) ?  34.0 : 0)
#define kMoneyUnit @"TCA"
#endif /* TGConfigure_h */
