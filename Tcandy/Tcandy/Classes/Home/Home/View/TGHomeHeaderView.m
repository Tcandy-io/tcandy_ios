//
//  TGHomeHeaderView.m
//  Tcandy
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGHomeHeaderView.h"
#import <SDCycleScrollView.h>
#import "TGNetwork.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface TGHomeHeaderView()
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;
- (IBAction)buttonPressed:(id)sender;

@end
@implementation TGHomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self requestUrl];
    }
    return self;
}
-(void)loadAds:(NSArray*)adGroup{
    _cycleScrollView.localizationImageNamesGroup  = @[@"apply_adv"];
}
-(void)requestUrl{
    [[TGNetwork shareWNetwork]httpPostPath:[banner stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] paras:nil complete:^(ResponseStatus status, NSInteger code, id  _Nullable response) {
        
    }];
}
- (IBAction)buttonPressed:(id)sender {
    UIButton *lbtn = (UIButton*)sender;
    switch (lbtn.tag) {
        case 0:
            //每日必强
        {
            Class class = NSClassFromString(@"TGTodayScareBuyViewController");
            if (class != nil) {
            UINavigationController *lnav = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
                UIViewController *lvc = [class new];
                [lnav pushViewController:lvc animated:YES];
            }
        }
            break;
        case 1:
            //聚划算
        {
            Class class = NSClassFromString(@"TGPreferentialViewController");
            if (class != nil) {
                UINavigationController *lnav = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
                UIViewController *lvc = ((id (*)(id, SEL,id))objc_msgSend)(class,NSSelectorFromString(@"createViewControllerWithValue:"),@"聚划算");//
                [lnav pushViewController:lvc animated:YES];
            }
        }
            break;
        case 2:
            //聚划算
        {
            Class class = NSClassFromString(@"TGPreferentialViewController");
            if (class != nil) {
                UINavigationController *lnav = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
                UIViewController *lvc = ((id (*)(id, SEL,id))objc_msgSend)(class,NSSelectorFromString(@"createViewControllerWithValue:"),@"九块九");//
                [lnav pushViewController:lvc animated:YES];
            }
        }
            break;
        case 3:
            //每日必强
        {
            Class class = NSClassFromString(@"TGHotSearchViewController");
            if (class != nil) {
                UINavigationController *lnav = (UINavigationController*)[UIApplication sharedApplication].delegate.window.rootViewController;
                UIViewController *lvc = [class new];
                [lnav pushViewController:lvc animated:YES];
            }
        }
            break;
            
        default:
            break;
    }
}
@end
