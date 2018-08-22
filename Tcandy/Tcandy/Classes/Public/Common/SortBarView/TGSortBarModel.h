//
//  TGSortBarModel.h
//  Tcandy
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TGBaseModel.h"
@interface TGSortBarModel : TGBaseModel
@property(nonatomic,strong)  NSString* title;
@property(nonatomic,strong)  NSString* normalImageName;
@property(nonatomic,strong)  NSString* upImageName;
@property(nonatomic,strong)  NSString* downImageName;
@property(nonatomic,strong)  NSArray* data;
@end
