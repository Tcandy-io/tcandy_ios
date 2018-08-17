//
//  TGMWalletOrderView.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

@interface TGMWalletBtnView : UIButton

@property (nonatomic,strong) UILabel *numLab;
@property (nonatomic,strong) UILabel *desLab;

@end

@implementation TGMWalletBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setSubViews];
    }
    return self;
}

- (void)setSubViews {
    
    _numLab = [[UILabel alloc]init];
    _numLab.textColor = RGB(215, 83, 124);
    [self addSubview:_numLab];
    _numLab.font = [UIFont systemFontOfSize:22];
    _numLab.textAlignment = NSTextAlignmentCenter;
    [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(5);
        make.height.equalTo(self.mas_height).multipliedBy(0.6);
    }];
    _numLab.text = @"28.00";
    
    _desLab = [[UILabel alloc]init];
    _desLab.textColor = [UIColor lightGrayColor];
    [self addSubview:_desLab];
    _desLab.font = [UIFont systemFontOfSize:16];
    _desLab.textAlignment = NSTextAlignmentCenter;
    [_desLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
        make.height.equalTo(self.mas_height).multipliedBy(0.4);
    }];
    _desLab.text = @"累计收益";
    
}

@end

#import "TGMWalletOrderView.h"

@interface TGMWalletOrderView ()

@property (nonatomic,strong) UIView *lineV;

@end

@implementation TGMWalletOrderView

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
    
    [self setHeadView];
    
    [self setContentView];
}

- (void)setContentView {
    UIView *contentView = [[UIView alloc]init];
    contentView.frame = CGRectMake(0, 61,  self.bounds.size.width, self.bounds.size.height - 61);
    [self addSubview:contentView];
    
    CGFloat viewW = self.bounds.size.width / 4.0;
    CGFloat viewH = self.bounds.size.height - 61;
    
    TGMWalletBtnView *firstV = [[TGMWalletBtnView alloc]initWithFrame:CGRectMake(0, 0, viewW, viewH)];
    [contentView addSubview:firstV];
    firstV.numLab.text =  @"28.00";
    firstV.desLab.text =  @"累计收益";

    TGMWalletBtnView *secV = [[TGMWalletBtnView alloc]initWithFrame:CGRectMake(viewW, 0, viewW, viewH)];
    [contentView addSubview:secV];
    secV.numLab.text =  @"28.00";
    secV.desLab.text =  @"自购收益";
    
    TGMWalletBtnView *thirdV = [[TGMWalletBtnView alloc]initWithFrame:CGRectMake(viewW * 2, 0, viewW, viewH)];
    [contentView addSubview:thirdV];
    thirdV.numLab.text =  @"0.00";
    thirdV.desLab.text =  @"即将到账";
    
    TGMWalletBtnView *fourthV = [[TGMWalletBtnView alloc]initWithFrame:CGRectMake(viewW * 3, 0, viewW, viewH)];
    [contentView addSubview:fourthV];
    fourthV.numLab.text =  @"0.00";
    fourthV.desLab.text =  @"累计提币";
}

- (void)setHeadView {
    UIView *headView = [[UIView alloc]init];
    [self addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    UIView *tagView = [[UIView alloc]init];
    tagView.backgroundColor = RGB(244, 0, 65);
    [headView addSubview:tagView];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(8);
        make.height.equalTo(headView.mas_height).multipliedBy(0.4);
        make.centerY.equalTo(headView.mas_centerY).mas_equalTo(0);
    }];
    
    UILabel *leftLab = [[UILabel alloc]init];
    leftLab.font = [UIFont systemFontOfSize:17];
    [headView addSubview:leftLab];
    leftLab.text = @"我的钱包";
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tagView.mas_right).mas_equalTo(10);
        make.centerY.equalTo(headView.mas_centerY).mas_equalTo(0);
    }];
    
    _lineV = [[UIView alloc]init];
    _lineV.backgroundColor = kBackgroundColor;
    [self addSubview:_lineV];
    [_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView.mas_bottom).mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

@end
