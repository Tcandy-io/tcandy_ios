//
//  TGMineInvitationView.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineInvitationView.h"

@interface TGMineInvitationView ()

@end

@implementation TGMineInvitationView

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
    tagView.backgroundColor = RGB(162, 0, 251);
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
    leftLab.text = @"我的邀请ID:";
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tagView.mas_right).mas_equalTo(10);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
    }];
    
    UILabel *idLab = [[UILabel alloc]init];
    idLab.font = [UIFont systemFontOfSize:19];
    idLab.textColor = RGB(215, 83, 124);
    [self addSubview:idLab];
    idLab.text = @"2201993";
    [idLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftLab.mas_right).mas_equalTo(3);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
    }];
    
}

@end
