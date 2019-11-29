//
//  PushManager.m
//  hybirdDemo
//
//  Created by edz on 2019/11/25.
//  Copyright © 2019 edz. All rights reserved.
//

#import "ObjectCTool.h"

@interface ObjectCTool()
{
    RCTPromiseResolveBlock _resolveBlock;
    RCTPromiseRejectBlock _rejectBlock;
}
@end

@implementation ObjectCTool
RCT_EXPORT_MODULE();

/* 0. 无参数，无回调 */
RCT_EXPORT_METHOD(testFunction){
    
    RCTLogInfo(@"baseInfomation 本地调用 ");
}
//
RCT_EXPORT_METHOD(showMessage:(NSString *)message type:(NSString *)type)
{
    RCTLogInfo(@"FlyElephant 本地调用 %@---%@---", message, type);
}


RCT_EXPORT_METHOD(blockCallbackEvent:(RCTResponseSenderBlock)callback)
{
    NSArray *events=@[@"Callback ", @"Block ", @"FlyElephant"];
    
    
    callback(@[[NSNull null],events]);
}


/* 1.有入参,没有返回值*/
RCT_EXPORT_METHOD(jumpToSettingWithType:(NSInteger)type message:(NSString*)message){
 
    NSString *title =[NSString stringWithFormat:@"title - %ld",(long)type];
    RCTLogInfo(@"FlyElephant 本地调用 %@---%@---", title, message);
    
}


/* 没有参数 有一个回调*/
RCT_EXPORT_METHOD(getAPPVersion:(RCTResponseSenderBlock)callback){
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSError * error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:infoDictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    callback(@[[NSNull null],jsonString]);
}


/* 多个参数，多个回调用*/
RCT_EXPORT_METHOD(requestWithAPI:(NSString *)host path:(NSString*)path success:(RCTPromiseResolveBlock)success fail:(RCTPromiseRejectBlock)fail){
    _resolveBlock = success;
    _rejectBlock = fail;
    
    
    NSInteger random = arc4random();
    if (random %2 ==0) {
        NSString *result = @"success code = 200";
        _resolveBlock(result);
    }else{
        NSString *message = @"request fail";
        NSString *code = @"404";
        NSError *err=[NSError errorWithDomain:@"test" code:0 userInfo:nil];
        _rejectBlock(code,message,err);
    }

}

RCT_EXPORT_METHOD(NavigateBack){
    dispatch_async(dispatch_get_main_queue(), ^{
           [[NSNotificationCenter defaultCenter] postNotificationName:@"NavigateBackNotifcation" object:nil];
    });
}


@end
