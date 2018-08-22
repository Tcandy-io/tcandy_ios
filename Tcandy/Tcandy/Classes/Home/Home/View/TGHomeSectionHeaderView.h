//
//  TGHomeSectionHeaderView.h
//  Tcandy
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TGHomeSectionHeaderViewDelegate<NSObject>
-(void)selectedShopChannal:(NSString*)name channalCode:(NSInteger)code;
@end
@interface TGHomeSectionHeaderView : UITableViewHeaderFooterView
@property(weak,nonatomic) id<TGHomeSectionHeaderViewDelegate> delegate;
@end
