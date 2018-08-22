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
-(void)saveSearchRecord:(NSString*)record{
    if (record != nil) {
        NSMutableArray *lrecords = [[self getSearchRecord] mutableCopy];
        if (lrecords.count > 0) {
            [lrecords removeObject:record];
            [lrecords addObject:record];
        }else{
            lrecords = [NSMutableArray arrayWithObject:record];
        }
        [[NSUserDefaults standardUserDefaults] setValue:lrecords forKey:@"KWSEARCHRECORD"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
-(NSArray<NSString*>*)getSearchRecord{
    NSArray *lrecords =[[NSUserDefaults standardUserDefaults] valueForKey:@"KWSEARCHRECORD"];
    return  lrecords == nil ? @[]:[[lrecords reverseObjectEnumerator] allObjects];
}
-(void)cleanSearchRecord{
    [[NSUserDefaults standardUserDefaults] setValue:@[] forKey:@"KWSEARCHRECORD"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
