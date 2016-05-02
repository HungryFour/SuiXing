//
//  LoginView.m
//  SuiXing
//
//  Created by 王阳 on 16/4/26.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "LoginView.h"
#import "SXTextField.h"

@interface LoginView ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) SXTextField *userNameTextField;
@property (strong, nonatomic) SXTextField *passwordTextField;

@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *registerButton;

@property (strong, nonatomic) UIView *thirdPartView;

@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.userNameTextField];
        [self addSubview:self.passwordTextField];
        [self addSubview:self.loginButton];
        [self addSubview:self.registerButton];
        [self addSubview:self.thirdPartView];
    }
    return self;
}

#pragma mark - event click
- (void)loginClick{
    NSString *username = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSDictionary *dict = @{@"username" : username , @"password" : password};
    if ([self.delegate respondsToSelector:@selector(buttonClickWithMethodName:parameters:)]) {
        [self.delegate buttonClickWithMethodName:@"loginClick:" parameters:dict];
    }
}

- (void)registerClick{
    if ([self.delegate respondsToSelector:@selector(buttonClickWithMethodName:parameters:)]) {
        [self.delegate buttonClickWithMethodName:@"registerClick:" parameters:nil];
    }
}

#pragma mark - Property

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, SX_SCREEN_WIDTH, 100)];
        _titleLabel.text = @"WelCome to Use SuiXing";
        _titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:36];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UITextField *)userNameTextField{
    if (!_userNameTextField) {
        _userNameTextField = [[SXTextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.titleLabel.frame), SX_SCREEN_WIDTH - 20*2, 50)];
        _userNameTextField.sx_placeHolder = @"Username";
        
        UIImageView *leftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 22)];
        leftView.contentMode = UIViewContentModeScaleAspectFit;
        leftView.image = [UIImage imageNamed:@"password"];
        _userNameTextField.sx_leftView = leftView;
        
        [_userNameTextField show];
        
    }
    return _userNameTextField;
}

- (UITextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[SXTextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.userNameTextField.frame)+20, SX_SCREEN_WIDTH - 20*2, 50)];
        _passwordTextField.sx_placeHolder = @"Password";
        _passwordTextField.secureTextEntry = YES;
        
        UIImageView *leftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 16, 22)];
        leftView.contentMode = UIViewContentModeScaleAspectFit;
        leftView.image = [UIImage imageNamed:@"username"];
        _passwordTextField.sx_leftView = leftView;
        
        [_passwordTextField show];
        
    }
    return _passwordTextField;
}


- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setFrame:CGRectMake(20, CGRectGetMaxY(self.passwordTextField.frame)+100, SX_SCREEN_WIDTH - 20*2, 50)];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _loginButton.titleLabel.textColor = UIColorFromRGB(0xffffff);
        _loginButton.backgroundColor = UIColorFromRGB(0x118AD2);
        [_loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginButton;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setFrame:CGRectMake(20,  CGRectGetMaxY(self.loginButton.frame)+20, SX_SCREEN_WIDTH - 20*2, 50)];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _registerButton.titleLabel.textColor = UIColorFromRGB(0xffffff);
        _registerButton.backgroundColor = UIColorFromRGB(0x118AD2);
        [_registerButton addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _registerButton;
}

- (UIView *)thirdPartView{
    if (!_thirdPartView) {
        _thirdPartView = [[UIView alloc]initWithFrame:CGRectMake(0, SX_SCREEN_HEIGHT - 100, SX_SCREEN_WIDTH, 80)];
        _thirdPartView.backgroundColor = [UIColor yellowColor];
    }
    return _thirdPartView;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
