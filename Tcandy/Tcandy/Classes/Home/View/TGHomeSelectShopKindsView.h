//
//  TGHomeSelectShopsView.h
//  Tcandy
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGHomeSelectShopKindsView : UIView

@end

@interface TGHomeShopKindsCell:UICollectionViewCell
-(void)configCell:(NSString*)title isSelected:(BOOL)isSelected;
@end;
