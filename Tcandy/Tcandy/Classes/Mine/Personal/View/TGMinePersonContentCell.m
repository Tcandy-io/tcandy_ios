//
//  TGMinePersonContentCell.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/20.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMinePersonContentCell.h"

@interface TGMinePersonContentCell ()

@property (weak, nonatomic) IBOutlet UILabel *desLab;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;


@end

@implementation TGMinePersonContentCell

- (void)setDesStr:(NSString *)desStr {
    _desStr = desStr;
    
    self.desLab.text = desStr;
}

- (void)setNameStr:(NSString *)nameStr {
    _nameStr = nameStr;
    
    self.nameLab.text = nameStr;
    
}

- (void)setHasBind:(BOOL)hasBind {
    _hasBind = hasBind;
    
    if (hasBind) {
        self.nameLab.text = @"立即绑定";
        self.nameLab.textColor = RGB(236, 0, 77);
    }
    else {
        self.nameLab.text = self.nameStr;
        self.nameLab.textColor = RGB(120, 120, 120);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.desLab.textColor = RGB(45, 45, 45);
    self.nameLab.textColor = RGB(120, 120, 120);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
