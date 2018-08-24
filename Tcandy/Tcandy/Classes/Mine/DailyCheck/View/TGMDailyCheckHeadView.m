//
//  TGMDailCheckHeadView.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/22.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMDailyCheckHeadView.h"

@interface TGMDailyCheckHeadView ()

@property (nonatomic,strong) UILabel *dayLab;

@end

@implementation TGMDailyCheckHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubViews];
    }
    return self;
}

- (void)setDayStr:(NSString *)dayStr {
    _dayStr = dayStr;
    
    NSString *str = [NSString stringWithFormat:@"第  %@  天",dayStr];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSRange firstR = [str rangeOfString:@"第  "];
    NSRange lastR = [str rangeOfString:@"  天"];
    NSRange ceterR = [str rangeOfString:dayStr];
    
    [attributedStr addAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor],NSFontAttributeName : SYSTEM_AdaptedFont(17)} range:firstR];
    [attributedStr addAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor],NSFontAttributeName : SYSTEM_AdaptedFont(17)} range:lastR];
    [attributedStr addAttributes:@{NSForegroundColorAttributeName : RGB(247, 0, 69),NSFontAttributeName : SYSTEM_AdaptedFont(24)} range:ceterR];
    _dayLab.attributedText = attributedStr;

}

#pragma mark - ui
- (void)setSubViews {
    
    UIImageView *bgImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sign_day_bj"]];
    bgImgV.frame = self.bounds;
    [self addSubview:bgImgV];
    
    UIImageView *headImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sign_continuous_bj"]];
    [self addSubview:headImgV];
    [headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgImgV.mas_centerX).mas_equalTo(0);
        make.top.mas_equalTo(30*KScaleY);
        make.left.mas_equalTo(60*KScaleX);
        make.right.mas_equalTo(-60*KScaleX);
        make.width.equalTo(headImgV.mas_height).multipliedBy(466/81);
    }];

    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.textColor = [UIColor whiteColor];
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headImgV.mas_centerX).mas_equalTo(0);
        make.centerY.equalTo(headImgV.mas_centerY).mas_equalTo(0);
    }];
    titleLab.font = SYSTEM_AdaptedFont(15);
    titleLab.text = @"已连续签到";
    
    //第几天
    _dayLab = [[UILabel alloc]init];
    [self addSubview:_dayLab];
    [_dayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headImgV.mas_centerX).mas_equalTo(0);
        make.top.equalTo(headImgV.mas_bottom).mas_equalTo(5 * KScaleY);
    }];
    
    CGFloat viewW = self.bounds.size.width;
    CGFloat viewH = self.bounds.size.height;
    CGFloat viewCenterX = viewW * 0.5;
    
    //签到按钮
    CGFloat checkBtnW = 130 * KScaleX;
    CGFloat checkBtnH = checkBtnW * 69 / 230.0;
    UIButton *checkBtn = [[UIButton alloc]init];
    [checkBtn setBackgroundImage:[UIImage imageNamed:@"sign_brn"] forState:0];
    [checkBtn setTitle:@"签到" forState:0];
    [checkBtn setTitleColor:[UIColor whiteColor] forState:0];
    checkBtn.titleLabel.font = SYSTEM_AdaptedFont(17);
    checkBtn.frame = CGRectMake(viewCenterX - checkBtnW * 0.5, viewH - 33 * KScaleY - checkBtnH * 0.5, checkBtnW, checkBtnH);
    [self addSubview:checkBtn];
    
    //显示星期
    CGFloat leftWeekLabX = 40;
    CGFloat weekLabWidth = (viewW - leftWeekLabX * 2) / 7;
    CGFloat weekLabHeight = 30;
    CGFloat weekLabY = CGRectGetMinY(checkBtn.frame) - weekLabHeight - 5 * KScaleY;

    NSArray *weekA = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    for (int i = 0; i < 7 ; i++) {
        UILabel *weekLab = [[UILabel alloc]init];
        weekLab.text = weekA[i];
        weekLab.font = SYSTEM_AdaptedFont(15);
        [self addSubview:weekLab];
        weekLab.textColor = [UIColor lightGrayColor];
        weekLab.frame = CGRectMake(weekLabWidth * i + leftWeekLabX, weekLabY, weekLabWidth, weekLabHeight);
        weekLab.textAlignment = NSTextAlignmentCenter;
    }
    
    //圆圈与线
    CGFloat leftCircleX = 50;
    CGFloat circleW = (viewW - leftCircleX * 2) / 13;
    CGFloat circleH = circleW;
    CGFloat circleY = weekLabY - circleH - 5 * KScaleY;

    CGFloat lineW = circleW;
    CGFloat lineH = lineW * 6 / 35;
    CGFloat lineY = circleY + circleH * 0.5 - lineH * 0.5;
    
    for (int i = 0; i < 7; i++) {
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.image = [UIImage imageNamed:@"sign_day_off"];
        [self addSubview:imgV];
        imgV.frame = CGRectMake(leftCircleX + circleW * i + lineW * i, circleY, circleW, circleH);
    }
    
    for (int i = 0; i < 6; i++) {
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.image = [UIImage imageNamed:@"sign_day_line_off"];
        [self addSubview:imgV];
        imgV.frame = CGRectMake(leftCircleX + circleW * (i + 1) + lineW * i, lineY, lineW, lineH);
    }

}

@end
