//
//  SXPresentTransition.h
//  SuiXing
//
//  Created by 王阳 on 16/4/15.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,SXPresentTransitionType){
    SXPresentTransitionPush = 0,
    SXPresentTransitionPop
};

@interface SXPresentTransition : NSObject <UIViewControllerAnimatedTransitioning>


+ (instancetype)transitionWithTransitionType:(SXPresentTransitionType)type;
- (instancetype)initWithTransitionType:(SXPresentTransitionType)type;

@end
