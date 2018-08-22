//
//  TGMineMessageCell.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/22.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMineMessageCell.h"

@interface TGMineMessageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *desLab;

@end

@implementation TGMineMessageCell

- (void)setImgStr:(NSString *)imgStr {
    _imgStr = imgStr;
    
    self.headImgV.image = [UIImage imageNamed:imgStr];
}

- (void)setNameStr:(NSString *)nameStr {
    _nameStr = nameStr;
    
    self.nameLab.text = nameStr;
}

- (void)setDesStr:(NSString *)desStr {
    _desStr = desStr;
    
    self.desLab.text = desStr;
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
