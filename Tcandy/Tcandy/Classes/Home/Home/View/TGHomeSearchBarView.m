//
//  TGHomeSeachBarView.m
//  Tcandy
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGHomeSearchBarView.h"
#import "TGConfigure.h"
@implementation TGHomeSearchBarView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton *scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [scanBtn setImage:[UIImage imageNamed:@"home_scan"] forState:UIControlStateNormal];
        [scanBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [scanBtn setImageEdgeInsets:UIEdgeInsetsMake(17, 27, 17, 27)];
        scanBtn.frame = CGRectMake(0,kTGStatusBarHeight, 80, 60);
        scanBtn.tag = 0;
        [self addSubview:scanBtn];
        
        UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(80, kTGStatusBarHeight+ 12, Main_Screen_Width-160, 35)];
        searchView.backgroundColor = UIColor.whiteColor;
        [searchView.layer setBorderColor:UIColor.clearColor.CGColor];
        [searchView.layer setBorderWidth:1];
        [searchView.layer setCornerRadius:17.5];
        searchView.clipsToBounds =  YES;
        UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *searchImage = [UIImage imageNamed:@"home_search"];
        [searchBtn setBackgroundImage:searchImage forState:UIControlStateNormal];
        [searchBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        searchBtn.frame = CGRectMake(0,0,301, 35);
        [searchView addSubview:searchBtn];
        searchBtn.tag = 1;
        [self addSubview:searchView];
        
        UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [newBtn setImage:[UIImage imageNamed:@"home_new"] forState:UIControlStateNormal];
        [newBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [newBtn setImageEdgeInsets:UIEdgeInsetsMake(17, 27, 17, 27)];
        newBtn.frame = CGRectMake(Main_Screen_Width - 80,kTGStatusBarHeight, 80, 60);
        newBtn.tag = 2;
        [self addSubview:newBtn];
        
    }
    return self;
}
-(void)buttonPressed:(UIButton*)sender{
    if (sender.tag == 1) {
        Class class = NSClassFromString(@"TGSearchViewController");
        if (class != nil) {
            UINavigationController *lnav = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
            UIViewController *lvc = [class new];
            [lnav pushViewController:lvc animated:YES];
        }
    }
    [[TGNetwork shareWNetwork]httpPostPath:kAddressURLStr paras:@{@"act":@"api",@"ctrl":@"getSlides"} complete:^(ResponseStatus status, NSInteger code, id  _Nullable response) {
        
    }];
}
@end
