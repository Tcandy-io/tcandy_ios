//
//  TGMAccountBindCell.m
//  Tcandy
//
//  Created by 陈彤 on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGMAccountBindCell.h"

@interface TGMAccountBindCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *statusLab;


@end

@implementation TGMAccountBindCell

- (void)setImgStr:(NSString *)imgStr {
    _imgStr = imgStr;
    
    self.headImgV.image = [UIImage imageNamed:imgStr];
}

- (void)setNameStr:(NSString *)nameStr{
    _nameStr = nameStr;
    
    self.nameLab.text = nameStr;
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
