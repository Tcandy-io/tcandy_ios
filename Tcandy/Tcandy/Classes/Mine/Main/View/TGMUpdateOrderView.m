//
//  TGMUpdateOrderView.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMUpdateOrderView.h"

@implementation TGMUpdateOrderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        
        [self setSubViews];
    }
    return self;
}

- (void)setSubViews {
    
    UIView *tagView = [[UIView alloc]init];
    tagView.backgroundColor = RGB(255, 234, 69);
    [self addSubview:tagView];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(8);
        make.height.equalTo(self.mas_height).multipliedBy(0.4);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
    }];
    
    UILabel *leftLab = [[UILabel alloc]init];
    leftLab.font = [UIFont systemFontOfSize:17];
    [self addSubview:leftLab];
    leftLab.text = @"升级购物节点";
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tagView.mas_right).mas_equalTo(10);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
    }];
    
    UIImageView *nextImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tablearrow"]];
    [self addSubview:nextImgV];
    [nextImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.width.height.mas_equalTo(25);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
    }];
    
    UILabel *rightLab = [[UILabel alloc]init];
    rightLab.font = [UIFont systemFontOfSize:15.5];
    rightLab.textColor = [UIColor lightGrayColor];
    rightLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:rightLab];
    rightLab.text = @"高人一等 瓜分十个亿";
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(nextImgV.mas_left).mas_equalTo(0);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
    }];
    
}


@end
