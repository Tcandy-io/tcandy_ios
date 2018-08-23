//
//  TGShopSectionHeaderReusableView.h
//  Tcandy
//
//  Created by mac on 2018/8/23.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGShopSectionHeaderReusableView : UICollectionReusableView
+(NSString*)reusableIdentifier;
@property (weak, nonatomic) IBOutlet UILabel *headerTitle_lab;
@end
