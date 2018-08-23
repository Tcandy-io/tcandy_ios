//
//  TGShopDetailHeaderReusableView.m
//  Tcandy
//
//  Created by mac on 2018/8/23.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGShopDetailHeaderReusableView.h"
#import <SDCycleScrollView.h>
@interface TGShopDetailHeaderReusableView()
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end
@implementation TGShopDetailHeaderReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //测试用
    _cycleScrollView.localizationImageNamesGroup  = @[@"popup_good",@"popup_good"];
    _shareBtn.titleLabel.numberOfLines = 0;
}
+(NSString*)reusableIdentifier{
    return @"kDetaiHeader";
}
@end
