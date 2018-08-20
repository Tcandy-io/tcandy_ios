//
//  TGNetwork.h
//  Tcandy
//
//  Created by mac on 2018/8/20.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define YDebug 1
#ifdef YDebug
#define kAddressURLStr  @"http://www.weirr.cn"
#else
#define kAddressURLStr  @"http://www.weirr.cn"
#endif

typedef NS_ENUM(NSInteger,ResponseStatus) {
    ResponseStatusSuccess = 0,
    ResponseStatusError,
    ResponseStatusNoData,
    ResponseStatusRequesting,
    ResponseStatusAllData
};
@interface TGNetwork : NSObject
+(TGNetwork*)shareWNetwork;
-(void)httpGetPath:(NSString*)path paras:(NSDictionary*)paras complete:(void(^)(ResponseStatus status,NSInteger code, id  _Nullable response))completeBlock;
-(void)httpPostPath:(NSString*)path paras:(NSDictionary*)paras complete:(void(^)(ResponseStatus status,NSInteger code, id  _Nullable response))completeBlock;
-(void)httpPostReturnImageDataPath:(NSString*)path paras:(NSDictionary*)paras complete:(void(^)(ResponseStatus status,NSInteger code, id  _Nullable response))completeBlock;
-(void)httpPostImagePath:(NSString*)path paras:(NSDictionary*)paras  imageNamePrefix:(NSString*)namePrefix image:(UIImage*)image complete:(void(^)(ResponseStatus status,NSInteger code, id  _Nullable response,NSString *imagePath))completeBlock;

@end

@interface ResponseModel:NSObject
@property(assign) NSInteger success;
@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) id  data;
@property(assign) ResponseStatus  status;
@end

