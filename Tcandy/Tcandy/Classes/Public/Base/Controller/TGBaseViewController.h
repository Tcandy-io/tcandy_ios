//
//  TGBaseViewController.h
//  Tcandy
//
//  Created by 开发 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGBaseViewController : UIViewController
@property(strong,nonatomic) void (^RightButtonPressed)(UIButton *button);
@property(strong,nonatomic) void (^LeftButtonPressed)(UIButton *button);

-(void)setRootNavigationBarColor:(UIColor*)color;
-(void)setLeftButtonImageName:(NSString*)name text:(NSString*)string edge:(UIEdgeInsets)edge isHide:(BOOL)hide;
-(void)setRightButtonImageName:(NSString*)name text:(NSString*)string edge:(UIEdgeInsets)edge isHide:(BOOL)hide;
-(void)setIsHideBack:(BOOL)hide;
-(void)hideNavigationView:(BOOL)hide;
-(void)setImageTitle:(NSString*)imageName url:(NSString*)imageUrl;
-(void)setRootTitleString:(NSString*)title;

//
+(instancetype)createViewControllerWithValue:(id)value;
@end
