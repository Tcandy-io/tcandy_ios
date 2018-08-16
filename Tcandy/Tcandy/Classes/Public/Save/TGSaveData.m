//
//  TGSaveData.m
//  Tcandy
//
//  Created by 开发 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGSaveData.h"

@implementation TGSaveData

static TGSaveData *saveDataIntace = nil;
+(TGSaveData*)shareTGSaveData{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        saveDataIntace = [[self alloc]init];
    });
    return saveDataIntace;
}

@end
