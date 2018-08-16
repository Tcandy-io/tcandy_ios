//
//  UIBarButtonItem+CT.m
//  新浪微博
//
//  Created by 123 on 16/10/18.
//  Copyright © 2016年 ct. All rights reserved.
//

#import "UIBarButtonItem+CT.h"

@implementation UIBarButtonItem (CT)

- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *image = [UIImage imageNamed:icon];
    [btn setBackgroundImage:image forState:0];
    [btn setBackgroundImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    btn.bounds = (CGRect){CGPointZero,image.size};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:btn];
}

+ (id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action {
    return [[self alloc]initWithIcon:icon highlightedIcon:highlighted target:target action:action];
}

@end
