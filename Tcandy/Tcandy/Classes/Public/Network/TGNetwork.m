//
//  TGNetwork.m
//  Tcandy
//
//  Created by mac on 2018/8/20.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#import "TGNetwork.h"
#import "AFNetworking.h"

#define CLog(format, ...)  NSLog(format, ## __VA_ARGS__)
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@interface TGNetwork()
{
    AFHTTPSessionManager *sessionManager;
}
@end
@implementation TGNetwork

static TGNetwork *networkInstance = nil;
+(TGNetwork*)shareWNetwork{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkInstance = [[self alloc] init];
       
    });
    return networkInstance;
}
-(id)init{
    if (self=[super init]) {
        sessionManager =  [self defaultSetAFHTTPSessionManager];
    }
    return self;
}
-(AFHTTPSessionManager*)defaultSetAFHTTPSessionManager{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30.0f;
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html",@"charset=utf-8",@"application/x-www-form-urlencoded"]];
    
    AFJSONResponseSerializer*response = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues=YES;
    manager.responseSerializer =  [AFHTTPResponseSerializer serializer];//response;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    
    return manager;
}
-(id)OCObjectWithUTF8:(id _Nullable)data{
    NSLog(@"----%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    if (data != nil) {
        NSError *error = nil;
        id lresultJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (lresultJson != nil) {
            return lresultJson;
        }
    }
    return nil;
}

-(void)httpGetPath:(NSString*)path paras:(NSDictionary*)paras complete:(void(^)(ResponseStatus status,NSInteger code, id  _Nullable response))completeBlock{
    NSString *lurlStr = [NSString stringWithFormat:@"%@/%@",kAddressURLStr,path];
    if (paras == nil) {
        return;
    }
    [sessionManager GET:lurlStr parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *lresponse=nil;
        lresponse = [self OCObjectWithUTF8:responseObject];
        NSLog(@"===%@",[lresponse description]);
//        ResponseModel *lresponseM =[ResponseModel mj_objectWithKeyValues:lresponse];
//        if (lresponseM.code == 0) {
//            completeBlock(ResponseStatusSuccess,0,lresponse);
//        }else{
//            completeBlock(ResponseStatusError,lresponseM.code,nil);
//        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"==----%@",[error description]);
        completeBlock(ResponseStatusError,-1,nil);
    }];
    
}
-(void)httpPostReturnImageDataPath:(NSString*)path paras:(NSDictionary*)paras complete:(void(^)(ResponseStatus status,NSInteger code, id  _Nullable response))completeBlock{
    NSString *lurlStr = [NSString stringWithFormat:@"%@/%@",kAddressURLStr,path];
    [sessionManager POST:lurlStr parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil ) {
            completeBlock(ResponseStatusSuccess,200,responseObject);
        }else{
            completeBlock(ResponseStatusError,-1,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"==----%@",[error description]);
        completeBlock(ResponseStatusError,-1,nil);
    }];
}
-(void)httpPostPath:(NSString*)path paras:(NSDictionary*)paras complete:(void(^)(ResponseStatus status, NSInteger code,id  _Nullable response))completeBlock{
    NSString *lurlStr = [NSString stringWithFormat:@"%@/%@",kAddressURLStr,path];
    [sessionManager POST:lurlStr parameters:paras progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *lresponse=nil;
        lresponse = [self OCObjectWithUTF8:responseObject];
        NSLog(@"===%@",[lresponse description]);
//        ResponseModel *lresponseM =[ResponseModel mj_objectWithKeyValues:lresponse];
//        if (lresponseM.code == 0) {
//            if ([lresponseM.data isKindOfClass:[NSDictionary class]]) {
//                if ([lresponseM.data allKeys].count == 0) {
//                    completeBlock(ResponseStatusSuccess,1,lresponse);
//                } else {
//                    completeBlock(ResponseStatusSuccess,0,lresponse);
//                }
//
//            }else if ([lresponseM.data isKindOfClass:[NSArray class]]){
//                completeBlock(ResponseStatusSuccess,0,lresponse);
//            } else{
//                completeBlock(ResponseStatusSuccess,1,lresponse);
//            }
//        }else{
//            completeBlock(ResponseStatusError,lresponseM.code,lresponse);
//        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"==----%@",[error description]);
        completeBlock(ResponseStatusError,-1,nil);
    }];
}
-(void)httpPostImagePath:(NSString*)path paras:(NSDictionary*)paras  imageNamePrefix:(NSString*)namePrefix image:(UIImage*)image complete:(void(^)(ResponseStatus status,NSInteger code, id  _Nullable response,NSString *imagePath))completeBlock{
    NSString *lurlStr = [NSString stringWithFormat:@"%@",kAddressURLStr];
    if (image == nil) {
        return;
    }
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    
    [sessionManager POST:lurlStr parameters:paras constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData){
        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.6) name:@"upload" fileName:@"aa.jpg" mimeType:@"image/jpg"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"xxx上传失败xxx %@", error);
    }];
}

@end

@implementation  ResponseModel
-(instancetype)init{
    if (self = [super init]) {
        self.success = -1;
        self.message = @"";
    }
    return self;
}
@end
