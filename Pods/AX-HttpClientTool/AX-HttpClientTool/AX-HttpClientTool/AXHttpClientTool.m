//
//  AXHttpClientTool.m
//  AX-HttpClientTool
//
//  Created by anxindeli on 2017/8/28.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "AXHttpClientTool.h"
#import <AFNetworking.h>
#import <NSString+PYMD5.h>
NSString * const PYRequestBaseUrlString = @"http://alpha.i.anxindeli.com/";
NSString * const kPrivateKey = @"anxindeli_a100_hongtaoA";

@implementation AXHttpClientTool

+ (instancetype)sharedTool{
    
    static AXHttpClientTool *_sharedTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedTool = [[AXHttpClientTool alloc] init];
    });
    
    return _sharedTool;
}

+ (AFHTTPSessionManager *)sharedHTTPClient{
    
    static AFHTTPSessionManager *_axHTTPClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _axHTTPClient = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:PYRequestBaseUrlString]];
        _axHTTPClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
    });
    
    return _axHTTPClient;
    
}

+ (NSURLSessionDataTask *)requestWithMethod:(NSString *)method url:(NSString *)url params:(NSDictionary *)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure
{
    __weak typeof(self) weakSelf = self;
    // url
    NSString *urlStr = url == nil ? @"" : url;
    // params
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:params];
    
    NSMutableDictionary *saltDict = [NSMutableDictionary dictionaryWithDictionary:params];
    [saltDict setValue:@"iPhone" forKey:@"client"];
    NSString *versionString = [weakSelf requestVersionStringFromBundle];
    [saltDict setValue:versionString forKey:@"version"];
    [saltDict setValue:@"ios" forKey:@"channelId"];
    [saltDict setValue:@"000_mainApp" forKey:@"channel"];
    [saltDict setValue:@"" forKey:@"appStyle"];
    NSString *network = [[NSUserDefaults standardUserDefaults] objectForKey:@"network"];
    if (network == nil) {
        network = @"";
    }
    saltDict[@"network"]= network;
    
    NSString *uuCode = @"";
    
    [saltDict setValue:uuCode forKey:@"uuCode"];
    
    //添加加盐字符串
    NSString *saltString = [weakSelf saltRequestComponent:saltDict];
    [parameters setValue:saltString forKey:@"sign"];
    
    
    NSString *filterUrlString = [weakSelf urlStringWithOriginUrlString:urlStr appendParameters:@{@"client":@"iPhone",@"version":versionString,@"channelId":@"ios",@"network":network,@"channel":@"000_mainApp",@"appStyle":@"",@"uuCode":uuCode}];
    
    [weakSelf netWorkStatus];
    // client
    AFHTTPSessionManager *client = [self sharedHTTPClient];
    NSMutableURLRequest *request = [client.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:filterUrlString relativeToURL:client.baseURL] absoluteString] parameters:parameters error:nil];
    
    __block NSURLSessionDataTask *task = [client dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        //
        //        [MBProgressHUD hideAllHUDsForView:nil];
        
        if (error) {
            if (failure) {
                //                QSQServerBusyTip
                failure(error);
            }
        } else {
            if (success) {
                success(responseObject);
            }
        }
    }];
    
    [task resume];
    
    return task;
}
+ (NSURLSessionDataTask *)GET:(NSString *)path params:(NSDictionary *)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure
{
    return [self requestWithMethod:@"GET" url:path params:params success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)path params:(NSDictionary *)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure
{
    return [self requestWithMethod:@"POST" url:path params:params success:success failure:failure];
}
+ (NSURLSessionDataTask *)PUT:(NSString *)path params:(NSDictionary *)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure{
    return [self requestWithMethod:@"PUT" url:path params:params success:success failure:failure];
}

#pragma mark -
#pragma mark - 对参数加盐
+ (NSString *)saltRequestComponent:(NSDictionary *)dict
{
    if (!dict) {
        return nil;
    }
    NSArray *keys = [dict allKeys];
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1,NSString *obj2){
        return [obj1 compare:obj2];
    }];
    NSString *saltString = [NSString string];
    for (int i = 0; i < [keys count]; i++) {
        NSString *keyString = [NSString stringWithFormat:@"%@",keys[i]];;
        saltString = [saltString stringByAppendingString:[NSString stringWithFormat:@"%@",dict[keyString]]];
    }
    saltString = [saltString stringByAppendingString:kPrivateKey];
    saltString = [NSString py_md5:saltString];
    
    return saltString;
}
#pragma mark -
#pragma mark - 从本地文件读取版本号
+ (NSString*)requestVersionStringFromBundle{
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
    //    debugLog(@"版本号:%@",appVersion);
    appVersion = [appVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    return appVersion;
}

#pragma mark -
#pragma mark urlString处理
+ (NSString*)urlEncode:(NSString*)str {
    //different library use slightly different escaped and unescaped set.
    //below is copied from AFNetworking but still escaped [] as AF leave them for Rails array parameter which we don't use.
    //https://github.com/AFNetworking/AFNetworking/pull/555
    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)str, CFSTR("."), CFSTR(":/?#[]@!$&'()*+,;="), kCFStringEncodingUTF8);
    return result;
}
+ (NSString *)urlParametersStringFromParameters:(NSDictionary *)parameters {
    NSMutableString *urlParametersString = [[NSMutableString alloc] initWithString:@""];
    if (parameters && parameters.count > 0) {
        for (NSString *key in parameters) {
            NSString *value = parameters[key];
            value = [NSString stringWithFormat:@"%@",value];
            value = [self urlEncode:value];
            [urlParametersString appendFormat:@"&%@=%@", key, value];
        }
    }
    return urlParametersString;
}

+ (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString appendParameters:(NSDictionary *)parameter{
    
    NSString *filteredUrl = originUrlString;
    NSString *paraUrlString = [self urlParametersStringFromParameters:parameter];
    if (paraUrlString && paraUrlString.length > 0) {
        if ([originUrlString rangeOfString:@"?"].location != NSNotFound) {
            filteredUrl = [filteredUrl stringByAppendingString:paraUrlString];
        } else {
            filteredUrl = [filteredUrl stringByAppendingFormat:@"?%@", [paraUrlString substringFromIndex:1]];
        }
        return filteredUrl;
    } else {
        return originUrlString;
    }
}
 
+ (void)netWorkStatus{
    
    //检测网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        //        debugLog(@"网络连接状态:%d",status);
        if (status == AFNetworkReachabilityStatusNotReachable) {
            
        }else if (status== AFNetworkReachabilityStatusReachableViaWWAN ) {
            
            [[NSUserDefaults standardUserDefaults] setObject:@"WWAN" forKey:@"network"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else if (status== AFNetworkReachabilityStatusReachableViaWiFi){
            
            [[NSUserDefaults standardUserDefaults] setObject:@"WiFi" forKey:@"network"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }];
    
}
 
@end
