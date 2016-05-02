//
//  RegisterView.m
//  SuiXing
//
//  Created by 王阳 on 16/5/2.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "RegisterView.h"
#import "SXTextField.h"

@interface RegisterView ()

@property (strong, nonatomic) SXTextField *userNameTextField;
@property (strong, nonatomic) SXTextField *passwordTextField;
@property (strong, nonatomic) SXTextField *mobileTextField;

@property (strong, nonatomic) UIButton *registerButton;

@end

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.userNameTextField];
        [self addSubview:self.passwordTextField];
        [self addSubview:self.registerButton];
        [self addSubview:self.mobileTextField];
    }
    return self;
}


- (void)registerClick{
    NSString *username = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *mobile = self.mobileTextField.text;
    NSDictionary *dict = @{@"username" : username , @"password" : password, @"mobile" : mobile};
    if ([self.delegate respondsToSelector:@selector(buttonClickWithMethodName:parameters:)]) {
        [self.delegate buttonClickWithMethodName:@"registerClick:" parameters:dict];
    }
}


#pragma mark - Property
- (UITextField *)userNameTextField{
    if (!_userNameTextField) {
        _userNameTextField = [[SXTextField alloc]initWithFrame:CGRectMake(20, 150, SX_SCREEN_WIDTH - 20*2, 50)];
        _userNameTextField.sx_placeHolder = @"Username";
        _userNameTextField.sx_editingX = 10;
        _userNameTextField.sx_placeHolderX = 10;
        _userNameTextField.sx_textX = 10;
        _userNameTextField.sx_borderX = 0;
        
        [_userNameTextField show];
        
    }
    return _userNameTextField;
}

- (UITextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[SXTextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.userNameTextField.frame)+20, SX_SCREEN_WIDTH - 20*2, 50)];
        _passwordTextField.sx_placeHolder = @"Password";
        _passwordTextField.sx_editingX = 10;
        _passwordTextField.sx_placeHolderX = 10;
        _passwordTextField.sx_textX = 10;
        _passwordTextField.sx_borderX = 0;
        [_passwordTextField show];
        
    }
    return _passwordTextField;
}

- (UITextField *)mobileTextField{
    if (!_mobileTextField) {
        _mobileTextField = [[SXTextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.passwordTextField.frame)+20, SX_SCREEN_WIDTH - 20*2, 50)];
        _mobileTextField.sx_placeHolder = @"Mobile";
        _mobileTextField.sx_editingX = 10;
        _mobileTextField.sx_placeHolderX = 10;
        _mobileTextField.sx_textX = 10;
        _mobileTextField.sx_borderX = 0;
        [_mobileTextField show];
        
    }
    return _mobileTextField;
}

- (UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setFrame:CGRectMake(20,  CGRectGetMaxY(self.mobileTextField.frame)+20, SX_SCREEN_WIDTH - 20*2, 50)];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _registerButton.titleLabel.textColor = UIColorFromRGB(0xffffff);
        _registerButton.backgroundColor = UIColorFromRGB(0x118AD2);
        [_registerButton addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _registerButton;
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
