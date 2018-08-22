//
//  TGSortBarModel.m
//  Tcandy
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGSortBarModel.h"

@implementation TGSortBarModel
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"";
        self.normalImageName = @"";
        self.upImageName = @"";
        self.downImageName = @"";
        self.data = @[];
    }
    return self;
}
@end
