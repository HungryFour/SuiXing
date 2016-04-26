//
//  LoginViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/25.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "LoginViewController.h"
#import <UIImage+YYAdd.h>
#import "LoginView.h"

@interface LoginViewController ()

@property (strong, nonatomic) UIImageView *bgImageView;
@property (strong, nonatomic) UIImage *image;

@end

@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"登录";
    [self.view addSubview:self.bgImageView];
    LoginView *login = [[LoginView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:login];
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

@end
