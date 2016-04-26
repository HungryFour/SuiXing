//
//  SXInteractiveTransition.h
//  SuiXing
//
//  Created by 关静 on 16/4/20.
//  Copyright © 2016年 yang. All rights reserved.
//  转场动画

#import <UIKit/UIKit.h>

typedef void(^GestureConifg)();

typedef NS_ENUM(NSUInteger, SXInteractiveTransitionGestureDirection) {//手势的方向
    SXInteractiveTransitionGestureDirectionLeft = 0,
    SXInteractiveTransitionGestureDirectionRight,
    SXInteractiveTransitionGestureDirectionUp,
    SXInteractiveTransitionGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, SXInteractiveTransitionType) {//手势控制哪种转场
    SXInteractiveTransitionTypePresent = 0,
    SXInteractiveTransitionTypeDismiss,
    SXInteractiveTransitionTypePush,
    SXInteractiveTransitionTypePop,
};


@interface SXInteractiveTransition : UIPercentDrivenInteractiveTransition

/**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
@property (nonatomic, assign) BOOL interation;
/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg presentConifg;
/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg pushConifg;

//初始化方法

+ (instancetype)interactiveTransitionWithTransitionType:(SXInteractiveTransitionType)type GestureDirection:(SXInteractiveTransitionGestureDirection)direction;
- (instancetype)initWithTransitionType:(SXInteractiveTransitionType)type GestureDirection:(SXInteractiveTransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;



@end
