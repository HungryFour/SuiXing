//
//  MF_NetAPIClient.h
//  MrFan
//  
//  Created by yangyang on 16/3/17.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <AFHTTPSessionManager.h>
#import <AFURLSessionManager.h>

typedef NS_ENUM(NSInteger,MF_NetWorkMethod){
    Get = 0,
    Post,
    Put,
    Delete
};

@interface MF_NetAPIClient : AFHTTPSessionManager

@property (assign) BOOL debug;//debug信息 默认为YES

@property (assign) BOOL needToken;//token 默认为YES
@property (assign) BOOL needSign;//签名 默认为YES
@property (assign) BOOL needEncrypt;//加密 默认为NO

+ (MF_NetAPIClient *)shareNetApiManager;

- (void)sendHTTPRequestWithpath:(NSString *)path
                 withParameters:(NSDictionary *)parameters
              withRequestMethod:(MF_NetWorkMethod)method
                andSuccessBlock:(void(^)(id data))successBlock
                 andFailedBlock:(void(^)(NSError *error))failedBlock;

@end