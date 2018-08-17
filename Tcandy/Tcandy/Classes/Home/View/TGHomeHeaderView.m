//
//  TGHomeHeaderView.m
//  Tcandy
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGHomeHeaderView.h"
#import <SDCycleScrollView.h>
@interface TGHomeHeaderView()
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;

@end
@implementation TGHomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

      
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
     
    }
    return self;
}
-(void)loadAds:(NSArray*)adGroup{
    _cycleScrollView.localizationImageNamesGroup  = @[@"apply_adv"];
}
@end
