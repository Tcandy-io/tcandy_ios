//
//  UIBarButtonItem+CT.h
//  新浪微博
//
//  Created by 123 on 16/10/18.
//  Copyright © 2016年 ct. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CT)

- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;

+ (id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;

@end
