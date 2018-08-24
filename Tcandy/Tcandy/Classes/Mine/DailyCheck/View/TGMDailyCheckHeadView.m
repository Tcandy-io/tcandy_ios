//
//  TGMDailCheckHeadView.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/22.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMDailyCheckHeadView.h"

@implementation TGMDailyCheckHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubViews];
    }
    return self;
}

- (void)setSubViews {
    
    UIImageView *bgImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sign_day_bj"]];
    bgImgV.frame = self.bounds;
    
    [self addSubview:bgImgV];
    
}

@end
