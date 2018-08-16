//
//  UIView+LoadXIBView.m
//  DeepAM
//
//  Created by 陈彤 on 2018/6/22.
//  Copyright © 2018年 ct. All rights reserved.
//

#import "UIView+LoadXIBView.h"

@implementation UIView (LoadXIBView)

+ (instancetype)loadViewFromXib_ND {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

@end
