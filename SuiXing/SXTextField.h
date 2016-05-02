//
//  SXTextField.h
//  SuiXing
//
//  Created by 王阳 on 16/4/26.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXTextField : UITextField

//textField property
@property (assign, nonatomic) UITextBorderStyle sx_borderStyle;
@property (strong, nonatomic) UIColor *sx_borderColor;
@property (strong, nonatomic) UIView *sx_leftView;
@property (assign, nonatomic) UITextFieldViewMode sx_leftTextFieldViewModel;
@property (strong, nonatomic) UIView *sx_rightView;
@property (assign, nonatomic) UITextFieldViewMode sx_rightTextFieldViewModel;


//placeholder property
@property (strong, nonatomic) NSString *sx_placeHolder;
@property (strong, nonatomic) UIColor *sx_placeColor;


//text property
@property (strong, nonatomic) NSString *sx_text;
@property (strong, nonatomic) UIColor *sx_textColor;
@property (assign, nonatomic) CGFloat sx_textFontSize;

//override property
@property (assign, nonatomic)CGFloat sx_textX;
@property (assign, nonatomic)CGFloat sx_borderX;
@property (assign, nonatomic)CGFloat sx_placeHolderX;
@property (assign, nonatomic)CGFloat sx_editingX;

- (void)show;

@end
