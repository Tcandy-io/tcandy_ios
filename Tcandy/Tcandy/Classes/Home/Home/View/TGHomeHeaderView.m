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
    _cycleScrollView.localizationImageNamesGroup  = @[@"apply_adv",@"popup_good"];
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
            UIViewController *lnav = (UINavigationController*)[self viewControllerSupportView:self];
                UIViewController *lvc = [class new];
                [lnav.navigationController pushViewController:lvc animated:YES];
            }
        }
            break;
        case 1:
            //聚划算
        {
            Class class = NSClassFromString(@"TGPreferentialViewController");
            if (class != nil) {
                 UIViewController *lnav = (UINavigationController*)[self viewControllerSupportView:self];
                UIViewController *lvc = ((id (*)(id, SEL,id))objc_msgSend)(class,NSSelectorFromString(@"createViewControllerWithValue:"),@"聚划算");//
                [lnav.navigationController pushViewController:lvc animated:YES];
            }
        }
            break;
        case 2:
            //聚划算
        {
            Class class = NSClassFromString(@"TGPreferentialViewController");
            if (class != nil) {
                UIViewController *lnav = (UINavigationController*)[self viewControllerSupportView:self];
                UIViewController *lvc = ((id (*)(id, SEL,id))objc_msgSend)(class,NSSelectorFromString(@"createViewControllerWithValue:"),@"九块九");//
                [lnav.navigationController pushViewController:lvc animated:YES];
            }
        }
            break;
        case 3:
            //每日必强
        {
            Class class = NSClassFromString(@"TGHotSearchViewController");
            if (class != nil) {
                UIViewController *lnav = (UINavigationController*)[self viewControllerSupportView:self];
                UIViewController *lvc = [class new];
                [lnav.navigationController pushViewController:lvc animated:YES];
            }
        }
            break;
            
        default:
            break;
    }
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
