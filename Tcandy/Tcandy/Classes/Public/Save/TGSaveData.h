//
//  TGSaveData.h
//  Tcandy
//
//  Created by 开发 on 2018/8/16.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGSaveData : NSObject

//
+(TGSaveData*)shareTGSaveData;
//搜索历史
-(void)saveSearchRecord:(NSString*)record;
-(void)cleanSearchRecord;
-(NSArray<NSString*>*)getSearchRecord;
@end
