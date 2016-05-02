//
//  MF_NetAPIManager.m
//  MrFan
//
//  Created by yangyang on 16/3/17.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "MF_NetAPIManager.h"
#import "MF_NetAPIClient.h"

#define MF_ApiClient [MF_NetAPIClient shareNetApiManager]
@interface MF_NetAPIManager ()

@property (strong, nonatomic) NSData *rawData;

@end

@implementation MF_NetAPIManager

static MF_NetAPIManager *manager;
static dispatch_once_t onceToken;

+ (MF_NetAPIManager *)shareManager{
    if (!manager) {
        dispatch_once(&onceToken, ^{
            manager = [[MF_NetAPIManager alloc]init];
        });
    }
    return manager;
}
//登录
- (void)loginWithParameters:(NSDictionary *)parameters{
    NSString *username = [parameters objectForKey:@"username"];
    NSString *password = parameters[@"password"];
    [BmobUser loginInbackgroundWithAccount:username andPassword:password block:^(BmobUser *user, NSError *error) {
        if (user) {
            if ([self.delegate respondsToSelector:@selector(manager:requestApiManagerDidSuccess:)]) {
                [self.delegate manager:self requestApiManagerDidSuccess:user];
            }
        } else {
            if ([self.delegate respondsToSelector:@selector(manager:requestApiManagerDidFailed:)]) {
                [self.delegate manager:self requestApiManagerDidFailed:error];
            }
        }
    }];
}

//注册
- (void)registerWithParameters:(NSDictionary *)parameters{
    BmobUser *bUser = [[BmobUser alloc] init];

    NSString *username = [parameters objectForKey:@"username"];
    NSString *password = parameters[@"password"];
    NSString *mobile = parameters[@"mobile"];
    NSLog(@"%@",parameters);
    [bUser setUsername:username];
    [bUser setPassword:password];
    [bUser setMobilePhoneNumber:mobile];
    
    [bUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
        if (isSuccessful){
            if ([self.delegate respondsToSelector:@selector(manager:requestApiManagerDidSuccess:)]) {
                [self.delegate manager:self requestApiManagerDidSuccess:nil];
            }
        } else {
            if ([self.delegate respondsToSelector:@selector(manager:requestApiManagerDidFailed:)]) {
                [self.delegate manager:self requestApiManagerDidFailed:error];
            }
        }
    }];
}

#pragma mark - Request
//test request
- (void)send_TestRequestWithParameters:(NSDictionary *)parameters{
    NSString *path = @"/appapi/publickey";
    MF_ApiClient.debug = NO;
    [[MF_NetAPIClient shareNetApiManager]sendHTTPRequestWithpath:path withParameters:parameters withRequestMethod:Post andSuccessBlock:^(id data) {
        if ([self.delegate respondsToSelector:@selector(manager:requestApiManagerDidSuccess:)]) {
            [self.delegate manager:self requestApiManagerDidSuccess:data];
        }
    } andFailedBlock:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(manager:requestApiManagerDidFailed:)]) {
            [self.delegate manager:self requestApiManagerDidFailed:error];
        }

    }];
}

@end