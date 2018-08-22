//
//  TGHomeSectionHeaderView.m
//  Tcandy
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGHomeSectionHeaderView.h"
#import "TGConfigure.h"

#define kTGSectionButtonWidth   80.0
#define kTGSectionButtonHeight  50.0
@interface TGHomeSectionHeaderView()

@property(nonatomic,strong) NSMutableArray<UIButton*> *shopBtns;
@property(nonatomic,strong) UIView *btmMark_view;
@property(nonatomic,strong) UIButton *selectedBtn;
@end

@implementation TGHomeSectionHeaderView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI];
    }
    return self;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    _shopBtns = [NSMutableArray array];
    //
    NSArray *btnTitles = @[@"淘宝",@"京东",@"拼多多"];
    CGFloat btn_w = kTGSectionButtonWidth;
    CGFloat btn_h = kTGSectionButtonHeight;
    for (int i = 0; i < btnTitles.count; i++) {
        UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [lbtn setTitle:btnTitles[i] forState:UIControlStateNormal];
        [lbtn setTitleColor:kTGTextColorRed forState:UIControlStateSelected];
        [lbtn setTitleColor:kTGTextColorGray forState:UIControlStateNormal];
        lbtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [lbtn addTarget:self action:@selector(selectShop:) forControlEvents:UIControlEventTouchUpInside];
        lbtn.frame = CGRectMake(Main_Screen_Width/2 -(btnTitles.count/2.0)*btn_w + btn_w*i , 0, btn_w, 50);
        lbtn.tag = i;
        [self addSubview:lbtn];
        [_shopBtns addObject:lbtn];
    }
    _btmMark_view = [[UIView alloc]initWithFrame:CGRectMake(Main_Screen_Width/2 -(btnTitles.count/2.0)*btn_w, btn_h-2, btn_w,2)];
    _btmMark_view.backgroundColor = kTGTextColorRed;
    [self addSubview:_btmMark_view];
    //
    [_shopBtns firstObject].selected = YES;
}
-(void)selectShop:(UIButton*)sender{
    _btmMark_view.center = CGPointMake(sender.center.x, kTGSectionButtonHeight - 2);
    _selectedBtn = sender;
    for (UIButton *lbtn in _shopBtns) {
        if (lbtn == _selectedBtn) {
            lbtn.selected = YES;
        }else{
            lbtn.selected = NO;
        }
    }
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(selectedShopChannal:channalCode:)]) {
        [self.delegate selectedShopChannal:sender.titleLabel.text channalCode:sender.tag];
    }
}
@end
