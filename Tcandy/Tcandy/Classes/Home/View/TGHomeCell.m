//
//  TGHomeCell.m
//  Tcandy
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGHomeCell.h"

@implementation TGHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(NSString*)cellIdentifier{
    return @"kHomeCellIdentify";
}
@end
