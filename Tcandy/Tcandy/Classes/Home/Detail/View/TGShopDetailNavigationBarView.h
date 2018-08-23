//
//  TGShopDetailNavigationBarView.h
//  Tcandy
//
//  Created by mac on 2018/8/23.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TGShopDetailNavigationBarViewDelegate<NSObject>
-(void)currentTitle:(NSString*)title index:(NSInteger)index;
@end
@interface TGShopDetailNavigationBarView : UIView
@property(weak) id<TGShopDetailNavigationBarViewDelegate> delegate;
-(void)selectedIndex:(NSInteger)index;
+(instancetype)createNavigationBarViewWithFrame:(CGRect)rect titles:(NSArray*)titles;
@end
