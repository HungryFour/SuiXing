//
//  SXTextField.m
//  SuiXing
//
//  Created by 王阳 on 16/4/26.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXTextField.h"

@interface SXTextField ()

@end

@implementation SXTextField


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.sx_borderStyle = UITextBorderStyleLine;
        self.sx_borderColor = UIColorFromRGB(0xffffff);
        self.sx_leftView = nil;
        self.sx_leftTextFieldViewModel = UITextFieldViewModeAlways;
        self.sx_rightView = nil;
        self.sx_rightTextFieldViewModel = UITextFieldViewModeAlways;
        self.sx_placeColor = UIColorFromRGB(0xffffff);
        self.sx_placeHolder = @"";
        
        self.sx_textColor = UIColorFromRGB(0xffffff);
        self.sx_text = @"";
        self.sx_textFontSize = 15;
        
        
    }
    return self;
}

#pragma mark - Override

- (CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectMake(30, bounds.origin.y, bounds.size.width, bounds.size.height);
}

- (CGRect)borderRectForBounds:(CGRect)bounds{
    return CGRectMake(0, bounds.size.height - 1, bounds.size.width, bounds.size.height);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    return CGRectMake(30, bounds.origin.y, bounds.size.width, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectMake(30, bounds.origin.y, bounds.size.width, bounds.size.height);
}

#pragma mark - methods

- (void)show{
    self.borderStyle = self.sx_borderStyle;
//    self.layer.borderColor = self.sx_borderColor.CGColor;
//    self.layer.borderWidth = 1.0f;
    
    if (self.sx_leftView) {
        self.leftView = self.sx_leftView;
        self.leftViewMode = self.sx_leftTextFieldViewModel;
    }
    
    if (self.sx_rightView) {
        self.rightView = self.sx_leftView;
        self.rightViewMode = self.sx_rightTextFieldViewModel;
    }
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:self.sx_placeHolder];
    [string addAttribute:NSForegroundColorAttributeName value:self.sx_placeColor range:NSMakeRange(0, self.sx_placeHolder.length)];
    self.attributedPlaceholder = string;
    
    self.text  = self.sx_text;
    self.textColor = self.sx_textColor;
    self.font = [UIFont systemFontOfSize:self.sx_textFontSize];
    
}

@end
