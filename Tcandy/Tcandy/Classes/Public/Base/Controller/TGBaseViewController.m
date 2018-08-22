//
//  TGBaseViewController.m
//  Tcandy
//
//  Created by 开发 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGBaseViewController.h"
#import <UIImageView+WebCache.h>
@interface TGBaseViewController ()
{
    UILabel *title_lab;
    UILabel *back_lab;
    UIImageView *back_imgV;
    UIButton *back_btn;
    UIButton *right_btn;
    //
    UIView *navigationView;
    UIImageView *titleImageView;
}
@end

@implementation TGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavinationUI];
}
-(void)setRootTitleString:(NSString*)title{
    title_lab.text = title;
}
-(void)setIsHideBack:(BOOL)hide{
    back_lab.hidden = hide;
    back_imgV.hidden = hide;
    back_btn.hidden = hide;
}
-(void)setRootBackString:(NSString*)string{
    back_lab.text = string;
}
-(void)setLeftButtonImageName:(NSString*)name text:(NSString*)string edge:(UIEdgeInsets)edge isHide:(BOOL)hide{
    [self setIsHideBack:hide];
    [self setRootBackString:string];
    if (name.length>0) {
        [back_btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [back_btn setImageEdgeInsets:edge];
    } else {
        [back_btn setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
        [back_btn setImageEdgeInsets:UIEdgeInsetsMake(11.5, 14, 11.5, 20)];
    }
    back_imgV.hidden = YES;
}
-(void)setRightButtonImageName:(NSString*)name text:(NSString*)string edge:(UIEdgeInsets)edge isHide:(BOOL)hide{
    right_btn.hidden = hide;
    [right_btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [right_btn setImageEdgeInsets:edge];
    [right_btn setTitle:string forState:UIControlStateNormal];
}
-(void)setRootNavigationBarColor:(UIColor*)color{
    navigationView.backgroundColor = color;
}
-(void)createNavinationUI{
    CGSize lsize = [UIScreen mainScreen].bounds.size;
    
    
    navigationView = [[UIView alloc]init];
    
    UIView *lnavinationBarView = [[UIView alloc]init];
    if ([[UIScreen mainScreen] bounds].size.height == 812.0) {
        navigationView.frame =CGRectMake(0,0, lsize.width, 88);
        lnavinationBarView.frame = CGRectMake(0,44, lsize.width, 44);
    } else {
        navigationView.frame =CGRectMake(0,0, lsize.width, 64);
        lnavinationBarView.frame =CGRectMake(0,20, lsize.width, 44);
    }
    navigationView.backgroundColor = UIColor.whiteColor;
    [self.view insertSubview:navigationView atIndex:9999];
    //    [self.view addSubview:navigationView];
    
    [navigationView addSubview:lnavinationBarView];
    
    title_lab = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, lnavinationBarView.frame.size.width - 120, lnavinationBarView.frame.size.height)];
    title_lab.font = [UIFont systemFontOfSize:18];
    title_lab.adjustsFontSizeToFitWidth = YES;
    title_lab.textAlignment = NSTextAlignmentCenter;
    title_lab.textColor = [UIColor whiteColor];
    [lnavinationBarView addSubview:title_lab];
    
    back_imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -7, 60, 60)];
    back_imgV.image = [UIImage imageNamed:@"disttibute_back"];
//    back_imgV.hidden = YES;
    [lnavinationBarView addSubview:back_imgV];
    
    back_lab = [[UILabel alloc] initWithFrame:CGRectMake(41, 0, 80, lnavinationBarView.frame.size.height)];
    back_lab.font = [UIFont systemFontOfSize:16];
    back_lab.textAlignment = NSTextAlignmentCenter;
    back_lab.textColor = [UIColor whiteColor];
    back_lab.hidden = YES;
    [lnavinationBarView addSubview:back_lab];
    
    back_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    back_btn.frame = CGRectMake(0, 0, 60, lnavinationBarView.frame.size.height);
    [back_btn addTarget:self action:@selector(rootBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    back_btn.hidden = YES;
    [lnavinationBarView addSubview:back_btn];
    
    right_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    right_btn.frame = CGRectMake(lsize.width - 120, 0, 100, lnavinationBarView.frame.size.height);
    right_btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [right_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [right_btn addTarget:self action:@selector(rootRightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    right_btn.hidden = YES;
    [lnavinationBarView addSubview:right_btn];
    
    [right_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-10);
    }];
    
    titleImageView = [[UIImageView alloc]init];
    titleImageView.frame = CGRectMake(0, 0, 54, 15);
    titleImageView.center = CGPointMake(CGRectGetWidth(lnavinationBarView.frame)/2, CGRectGetHeight(lnavinationBarView.frame)/2);
    [lnavinationBarView addSubview:titleImageView];
}
-(void)rootBackButtonPressed:(id)sender{
    if (self.LeftButtonPressed != nil) {
        self.LeftButtonPressed(sender);
    } else {
        if (self.navigationController != nil) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
-(void)rootRightButtonPressed:(id)sender{
    if (self.RightButtonPressed != nil) {
        self.RightButtonPressed((UIButton*)sender);
    }
}
-(void)hideNavigationView:(BOOL)hide{
    navigationView.hidden = hide;
}
-(void)setImageTitle:(NSString*)imageName url:(NSString*)imageUrl{
    [titleImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:imageName]];
}

@end
