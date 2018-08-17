//
//  TGMOrdeListView.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

@interface TGMOrdeBtn : UIButton


@end

@implementation TGMOrdeBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imgBackH = contentRect.size.height * 0.6;
    CGFloat imgW = 40;
    CGFloat imgH = imgW;
    CGFloat imgX = contentRect.size.width * 0.5 - imgW * 0.5;
    CGFloat imgY = imgBackH * 0.5 - imgW * 0.5;

    return CGRectMake(imgX, imgY, imgW, imgH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * 0.4;
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * 0.6;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}


- (void)setHighlighted:(BOOL)highlighted {
}

@end

#import "TGMOrdeListView.h"

@interface TGMOrdeListView ()

@property (nonatomic,strong) UIView *lineV;

@end

@implementation TGMOrdeListView

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
    
    NSArray *titleA = @[@"全部订单",@"即将到账",@"已到账",@"无效订单"];
    NSArray *imgA = @[@"my_order_shz",@"my_order_jjdz",@"my_order_ydz",@"my_order_wxdd"];

    UIView *contentView = [[UIView alloc]init];
    contentView.frame = CGRectMake(0, 61 + 10,  self.bounds.size.width, self.bounds.size.height - 61 - 20);
    [self addSubview:contentView];
    
    CGFloat viewW = contentView.bounds.size.width / 4.0;
    CGFloat viewH = contentView.bounds.size.height;
    
    for (int i = 0; i < 4; i++) {
        TGMOrdeBtn *btn = [[TGMOrdeBtn alloc]initWithFrame:CGRectMake(viewW * i, 0, viewW, viewH)];
        [contentView addSubview:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitle:titleA[i] forState:0];
        [btn setTitleColor:[UIColor lightGrayColor] forState:0];
        [btn setImage:[UIImage imageNamed:imgA[i]] forState:0];
    }

}


- (void)setHeadView {
    UIView *headView = [[UIView alloc]init];
    [self addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    UIView *tagView = [[UIView alloc]init];
    tagView.backgroundColor = RGB(246, 84, 135);
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
    leftLab.text = @"订单中心";
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tagView.mas_right).mas_equalTo(10);
        make.centerY.equalTo(headView.mas_centerY).mas_equalTo(0);
    }];

    UIImageView *nextImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tablearrow"]];
    [headView addSubview:nextImgV];
    [nextImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.width.height.mas_equalTo(25);
        make.centerY.equalTo(headView.mas_centerY).mas_equalTo(0);
    }];
    
    UILabel *rightLab = [[UILabel alloc]init];
    rightLab.font = [UIFont systemFontOfSize:15.5];
    rightLab.textColor = [UIColor lightGrayColor];
    rightLab.textAlignment = NSTextAlignmentRight;
    [headView addSubview:rightLab];
    rightLab.text = @"查看全部订单";
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(nextImgV.mas_left).mas_equalTo(0);
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
