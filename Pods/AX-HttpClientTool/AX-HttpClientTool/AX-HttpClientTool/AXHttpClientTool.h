//
//  AXHttpClientTool.h
//  AX-HttpClientTool
//
//  Created by anxindeli on 2017/8/28.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HttpRequestSuccess)(id JSON);
typedef void (^HttpRequestFailure)(NSError *error);

@interface AXHttpClientTool : NSObject
+ (instancetype)sharedTool;

+ (NSURLSessionDataTask *)POST:(NSString *)path params:(NSDictionary *)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure;

+ (NSURLSessionDataTask *)GET:(NSString *)path params:(NSDictionary *)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure;

+ (NSURLSessionDataTask *)PUT:(NSString *)path params:(NSDictionary *)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure;
@end
