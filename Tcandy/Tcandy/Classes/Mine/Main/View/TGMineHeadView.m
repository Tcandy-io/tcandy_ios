//
//  TGMineHeadView.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineHeadView.h"

@interface TGMineHeadView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHL;


@end

@implementation TGMineHeadView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.viewHL.constant = NAVI_HEIGHT;
    
}

@end
