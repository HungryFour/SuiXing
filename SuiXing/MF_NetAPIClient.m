//  MF_NetAPIClient.m
//  MrFan
//
//  Created by yangyang on 16/3/17.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "MF_NetAPIClient.h"

@interface MF_NetAPIClient ()

@end

@implementation MF_NetAPIClient

static MF_NetAPIClient *manager = nil;
static dispatch_once_t onceToken;
+ (MF_NetAPIClient *)shareNetApiManager{
    dispatch_once(&onceToken, ^{
        manager = [[MF_NetAPIClient alloc]initWithBaseURL:[NSURL URLWithString:[NSObject BaseURL]]];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    });
    return manager;
}

- (instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (self) {
        _debug = YES;
        _needSign = YES;
        _needToken = YES;
        _needEncrypt = NO;
        
    }
    return self;
}

- (NSDictionary *)compileParameters:(NSDictionary *)parameters{
    
    if (_needToken) {
        
    }
    
    if (_needSign) {
        
    }
    
    if (_needEncrypt) {
        
    }
    
    return parameters;
}


- (void)sendHTTPRequestWithpath:(NSString *)path
                 withParameters:(NSDictionary *)parameters
              withRequestMethod:(MF_NetWorkMethod)method
                andSuccessBlock:(void(^)(id data))successBlock
                 andFailedBlock:(void(^)(NSError *error))failedBlock{
    
    NSDictionary *args = [self compileParameters:parameters];

    switch (method) {
        case Get:
        {
            [manager GET:path parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                successBlock(responseObject);

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failedBlock(error);

            }];
        }
            break;
        case Post:
        {
            [manager POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                if (_debug) {
                    DebugLog(@"%@",path);
                }
                successBlock(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failedBlock(error);

            }];

        }
            break;
        case Put:
        {
            [manager PUT:path parameters:args success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            
        }
            break;
        case Delete:
        {
            [manager DELETE:path parameters:args success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            
        }
            break;
        default:
            break;
    }
    
    
}

@end

