//
//  SXViewControllerInteceptor.m
//  SuiXing
//
//  Created by 关静 on 16/4/6.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXViewControllerInteceptor.h"
#import "IndexViewController.h"
#import "LoginViewController.h"
#import <Aspects/Aspects.h>

@implementation SXViewControllerInteceptor

+ (void)load{
    /* + (void)load 会在应用启动的时候自动被runtime调用，通过重载这个方法来实现最小的对业务方的“代码入侵” */
    [super load];
    [self shareInstance];
}

+ (instancetype)shareInstance{
    static SXViewControllerInteceptor *inteceptor = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        inteceptor = [[SXViewControllerInteceptor alloc]init];
    });
    return inteceptor;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [UIViewController aspect_hookSelector:@selector(loadView) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            [self loadView:[aspectInfo instance]];
        } error:nil];
        
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            [self viewWillAppear:[aspectInfo instance]];
        } error:nil];
        
        [UIViewController aspect_hookSelector:@selector(viewWillDisappear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            [self viewWillDisappear:[aspectInfo instance]];
        } error:nil];
        
        [UIViewController aspect_hookSelector:@selector(init) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            [self init:[aspectInfo instance]];
        } error:nil];
        
    }
    return self;
}

- (void)loadView:(UIViewController *)viewController{
    //DebugLog(@"%@ load view run",[viewController class]);
}

- (void)viewWillAppear:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[IndexViewController class]] || [viewController isKindOfClass:[LoginViewController class]]) {
        viewController.navigationController.navigationBar.hidden = YES;
    }
}

- (void)viewWillDisappear:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[IndexViewController class]]) {
        viewController.navigationController.navigationBar.hidden = NO;
    }
}

- (void)init:(UIViewController *)viewController{
    viewController.hidesBottomBarWhenPushed = YES;
}

@end
