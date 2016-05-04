//
//  MF_NetAPIManager.h
//  MrFan
//
//  Created by yangyang on 16/3/17.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MF_NetAPIClient;
@class MF_NetAPIManager;

@protocol MFNetApiDelegate <NSObject>

@required

- (void)manager:(MF_NetAPIManager *)manager requestApiManagerDidSuccess:(NSData *)data;
- (void)manager:(MF_NetAPIManager *)manager requestApiManagerDidFailed:(NSError *)error;

@end

@interface MF_NetAPIManager : NSObject

@property (weak, nonatomic) id <MFNetApiDelegate> delegate;

+ (MF_NetAPIManager *)shareManager;

//登录
- (void)loginWithParameters:(NSDictionary *)parameters;
//注册
- (void)registerWithParameters:(NSDictionary *)parameters;
//游记上传图片
- (void)uploadImage;

//测试request
- (void)send_TestRequestWithParameters:(NSDictionary *)parameters;


@end
