//
//  RegisterViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/5/2.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import <UIImage+YYAdd.h>

@interface RegisterViewController () <MFNetApiDelegate,ButtonClickDelegate>

@property (strong, nonatomic) UIImageView *bgImageView;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIButton *backButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.bgImageView];
    [MF_NetAPIManager shareManager].delegate = self;
    RegisterView *registerView = [[RegisterView alloc]initWithFrame:self.view.bounds];
    registerView.delegate = self;
    [self.view addSubview:registerView];
    [self.view addSubview:self.backButton];
}

- (void)registerClick:(NSDictionary *)dict{
    [[MF_NetAPIManager shareManager]registerWithParameters:dict];
}

- (void)backClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ButtonClickDelegate

- (void)buttonClickWithMethodName:(NSString *)name parameters:(NSDictionary *)dict{
    SEL action = NSSelectorFromString(name);
    [self performSelector:action withObject:dict];
}

#pragma mark - MFNetApiDelegate

- (void)manager:(MF_NetAPIManager *)manager requestApiManagerDidSuccess:(NSData *)data{
    [SVProgressHUD showSuccessWithStatus:@"注册成功"];
    [self dismissViewControllerAnimated:YES completion:^{
    
    }];
    NSLog(@"success");
}

- (void)manager:(MF_NetAPIManager *)manager requestApiManagerDidFailed:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
}

#pragma mark - Property

- (UIImage *)image{
    _image = [UIImage imageNamed:@"desk4.jpg"];
    return _image;
}

- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SX_SCREEN_WIDTH, SX_SCREEN_HEIGHT)];
        _bgImageView.backgroundColor = [UIColor clearColor];
        _bgImageView.image = [self.image imageByBlurSoft];
    }
    return _bgImageView;
}

- (UIButton *)backButton{
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setFrame:CGRectMake(20, 30, 50, 50)];
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    return _backButton;
}


@end
