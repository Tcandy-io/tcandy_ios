//
//  TGShopDetailNavigationBarView.m
//  Tcandy
//
//  Created by mac on 2018/8/23.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGShopDetailNavigationBarView.h"
#import "TGConfigure.h"
#define kTGShopDetailNavigationBarViewButtonWidth   80.0
#define kTGShopDetailNavigationBarViewHeight  50.0
@interface TGShopDetailNavigationBarView()
@property(nonatomic,strong) NSMutableArray<UIButton*> *shopBtns;
@property(nonatomic,strong) UIView *btmMark_view;
@property(nonatomic,strong) UIButton *selectedBtn;
@property(nonatomic,strong) NSArray *titles;
@end
@implementation TGShopDetailNavigationBarView

+(instancetype)createNavigationBarViewWithFrame:(CGRect)rect titles:(NSArray*)titles{
   TGShopDetailNavigationBarView *lbarView =  [[TGShopDetailNavigationBarView alloc]initWithFrame:rect];
    lbarView.titles = [titles copy];
    return lbarView;
}
-(void)layoutSubviews{
    if (_shopBtns == nil) {
         [self initUI];
    }
}
-(void)initUI{
    _shopBtns = [NSMutableArray array];
    //
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lbtn.frame = CGRectMake(20, kTGSafeAreaTop -42, 40, 40);
    [lbtn setBackgroundImage:[UIImage imageNamed:@"brand_back"] forState:UIControlStateNormal];
    [lbtn addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:lbtn];
    //
    NSArray *btnTitles = _titles;
    CGFloat btn_w = kTGShopDetailNavigationBarViewButtonWidth;
    CGFloat btn_h = self.frame.size.height- 2;
    for (int i = 0; i < btnTitles.count; i++) {
        UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [lbtn setTitle:btnTitles[i] forState:UIControlStateNormal];
        [lbtn setTitleColor:kTGTextColorRed forState:UIControlStateSelected];
        [lbtn setTitleColor:kTGTextColorGray forState:UIControlStateNormal];
        lbtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [lbtn addTarget:self action:@selector(selectShop:) forControlEvents:UIControlEventTouchUpInside];
        lbtn.frame = CGRectMake(CGRectGetWidth(self.frame)/2 -(btnTitles.count/2.0)*btn_w + btn_w*i , self.frame.size.height -50, btn_w, 50);
        lbtn.tag = i;
        [self addSubview:lbtn];
        [_shopBtns addObject:lbtn];
    }
    _btmMark_view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/2 -(btnTitles.count/2.0)*btn_w, btn_h-2, btn_w, 2)];
    _btmMark_view.backgroundColor = kTGTextColorRed;
    [self addSubview:_btmMark_view];
    //
    [_shopBtns firstObject].selected = YES;
}
-(void)selectShop:(UIButton*)sender{
    _btmMark_view.center = CGPointMake(sender.center.x, self.frame.size.height- 2);
    _selectedBtn = sender;
    for (UIButton *lbtn in _shopBtns) {
        if (lbtn == _selectedBtn) {
            lbtn.selected = YES;
        }else{
            lbtn.selected = NO;
        }
    }
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(currentTitle:index:)]) {
        [self.delegate currentTitle:sender.titleLabel.text index:sender.tag];
    }
}
-(void)selectedIndex:(NSInteger)index{
     _selectedBtn = _shopBtns[index];
    _btmMark_view.center = CGPointMake(_selectedBtn.center.x, self.frame.size.height- 2);
    for (UIButton *lbtn in _shopBtns) {
        if (lbtn == _selectedBtn) {
            lbtn.selected = YES;
        }else{
            lbtn.selected = NO;
        }
    }
}
-(void)backButtonPressed:(id)sender{
    [[self viewControllerSupportView:self].navigationController popViewControllerAnimated:YES];
}
- (UIViewController *)viewControllerSupportView:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
