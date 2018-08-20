//
//  TGMineSettingCell.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/20.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineSettingCell.h"

@interface TGMineSettingCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIImageView *nextImgV;

@end

@implementation TGMineSettingCell

- (void)setImgStr:(NSString *)imgStr {
    _imgStr = imgStr;
    
    self.headImgV.image = [UIImage imageNamed:imgStr];
}

- (void)setNameStr:(NSString *)nameStr {
    _nameStr = nameStr;
    
    self.nameLab.text = nameStr;
}

- (void)setHasNextImg:(BOOL)hasNextImg {
    _hasNextImg = hasNextImg;
    
    if (hasNextImg) {
        self.nextImgV.hidden = NO;
    }
    else {
        self.nextImgV.hidden = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
