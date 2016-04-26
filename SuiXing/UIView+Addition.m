//
//  UIView+Addition.m
//  SuiXing
//
//  Created by 关静 on 16/4/15.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

- (UIViewController *)viewController {
    UIResponder *next = self.nextResponder;
    
    do {
        //判断响应者是否为视图控制器
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
    } while (next != nil);
    
    return nil;
}

@end
