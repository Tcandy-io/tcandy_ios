//
//  Macros.h
//  Tcandy
//
//  Created by 陈彤 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

// MainScreen bounds
#define Main_Screen_Bounds [[UIScreen mainScreen] bounds]

// MainScreen Height&Width
#define Main_Screen_Height [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width [[UIScreen mainScreen] bounds].size.width

#define NAVI_HEIGHT ((Main_Screen_Height == 812.0) ? 88.0 : 64.0)
#define TabBar_HEIGHT ((Main_Screen_Height == 812.0) ? 83.0 : 49.0)

#define KScaleX (Main_Screen_Width/414.0)
#define KScaleY (Main_Screen_Height/736.0)

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define random_Color RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//状态栏高度
#define kIOSIphoneX  ((Main_Screen_Height == 812.0) ? YES : NO)
#define kStatusBarHeight (kIOSIphoneX ? 44.0:20.0)
//背景颜色
#define kBackgroundColor RGB(245,245,245)

#endif /* Macros_h */
