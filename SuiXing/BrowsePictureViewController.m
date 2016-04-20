//
//  BrowsePictureViewController.m
//  SuiXing
//
//  Created by 王阳 on 16/4/15.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "BrowsePictureViewController.h"
#import "SXInteractiveTransition.h"
#import "SXPresentTransition.h"

@interface BrowsePictureViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) SXInteractiveTransition *interactiveTransition;

@end

@implementation BrowsePictureViewController


- (instancetype)init{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"神奇移动";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    self.imageView = imageView;
    [self.view addSubview:imageView];
    imageView.center = CGPointMake(self.view.center.x, self.view.center.y - self.view.height / 2 + 210);
    imageView.bounds = CGRectMake(0, 0, 280, 280);

    //初始化手势过渡的代理
    self.interactiveTransition = [SXInteractiveTransition interactiveTransitionWithTransitionType:SXInteractiveTransitionTypePop GestureDirection:SXInteractiveTransitionGestureDirectionRight];
    //给当前控制器的视图添加手势
    [_interactiveTransition addPanGestureForViewController:self];
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    NSLog(@"%@", NSStringFromCGRect(self.imageView.frame));
    //分pop和push两种情况分别返回动画过渡代理相应不同的动画操作
    return [SXPresentTransition transitionWithTransitionType:operation == UINavigationControllerOperationPush ? SXPresentTransitionPush : SXPresentTransitionPop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    //手势开始的时候才需要传入手势过渡代理，如果直接点击pop，应该传入空，否者无法通过点击正常pop
    return _interactiveTransition.interation ? _interactiveTransition : nil;
}

@end
