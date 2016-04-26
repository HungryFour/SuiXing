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
