//
//  CALayer+UIColor.m
//  Tcandy
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "CALayer+UIColor.h"
@implementation CALayer(AdditionColor)
- (void)setBorderColorFromUIColor:(UIColor *)color;
{
    self.borderColor = color.CGColor;
}
@end
