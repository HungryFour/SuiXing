//
//  RegisterView.h
//  SuiXing
//
//  Created by 王阳 on 16/5/2.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonClickDelegate <NSObject>

- (void)buttonClickWithMethodName:(NSString *)name parameters:(NSDictionary *)dict;

@end

@interface RegisterView : UIView

@property (weak, nonatomic) id<ButtonClickDelegate> delegate;

@end
