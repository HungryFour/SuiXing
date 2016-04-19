//
//  SXPresentTransition.m
//  SuiXing
//
//  Created by 王阳 on 16/4/15.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXPresentTransition.h"

@implementation SXPresentTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //将两种动画逻辑分开，变得更加清晰
    switch (_type) {
        case SXPresentTransitionPresent:
            [self presentAnimation:transitionContext];
            break;
        case SXPresentTransitionDismiss:
            [self dismissAnimation:transitionContext];
            break;
        default:
            break;
    }
}


#pragma mark - Private Method
//实现present动画逻辑代码
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
}
//实现dismiss动画逻辑代码
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
}
//
//+ (instancetype)transitionWithTransitionType:(SXPresentTransitionType)type{
//    
//}
//+ (instancetype)initWithTransitionType:(SXPresentTransitionType)type{
//    
//}

@end
