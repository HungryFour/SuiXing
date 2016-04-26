//
//  SXPresentTransition.m
//  SuiXing
//
//  Created by 王阳 on 16/4/15.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXPresentTransition.h"
#import "IndexViewController.h"
#import "TopicRoadCell.h"

@interface SXPresentTransition ()

@property (assign, nonatomic) SXPresentTransitionType type;

@end

@implementation SXPresentTransition

#pragma mark - Init Methods

+ (instancetype)transitionWithTransitionType:(SXPresentTransitionType)type{
    return [[self alloc]initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(SXPresentTransitionType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

/**
 *  动画时长
 */

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //将两种动画逻辑分开，变得更加清晰
    switch (_type) {
        case SXPresentTransitionPush:
            [self pushAnimation:transitionContext];
            break;
        case SXPresentTransitionPop:
            [self popAnimation:transitionContext];
            break;
        default:
            break;
    }
}


#pragma mark - Private Method
//实现present动画逻辑代码
- (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    IndexViewController *fromVC = (IndexViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BrowsePictureViewController *toVC = (BrowsePictureViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //拿到当前点击的cell的ImageView
    TopicRoadCell *cell = (TopicRoadCell *)[fromVC.collectionView cellForItemAtIndexPath:fromVC.currentIndexPath];
    UIView *containerView = [transitionContext containerView];
    
    //snapshotViewAfterScreenUpdates 对cell的imageView截图保存成另一个视图用于过度，并将视图转换到当前控制器的坐标
    UIView *tempView = [cell.imageView snapshotViewAfterScreenUpdates:YES];
    tempView.frame = [cell.imageView convertRect:cell.imageView.bounds toView:containerView];
    
    //设置动画前的各个控件的状态
    cell.imageView.hidden = YES;
    toVC.view.alpha = 0;
    toVC.imageView.hidden = YES;
    //tempView 添加到container中，要保证在最前方，所以后添加
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    
    //开始做动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        tempView.frame = [toVC.imageView convertRect:toVC.imageView.bounds toView:containerView];
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        toVC.imageView.hidden = NO;
        //如果动画过渡取消了就标记不完成，否则才完成，这里可以直接写YES，如果有手势过渡才需要判断，必须标记，否则系统不会中动画完成的部署，会出现无法交互之类的bug
        [transitionContext completeTransition:YES];
    }];
    
}
//实现dismiss动画逻辑代码
- (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    BrowsePictureViewController *fromVC = (BrowsePictureViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    IndexViewController *toVC = (IndexViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    TopicRoadCell *cell = (TopicRoadCell *)[toVC.collectionView cellForItemAtIndexPath:toVC.currentIndexPath];
    UIView *containerView = [transitionContext containerView];
    //这里的lastView就是push时候初始化的那个tempView
    UIView *tempView = containerView.subviews.lastObject;
    //设置初始状态
    cell.imageView.hidden = YES;
    fromVC.imageView.hidden = YES;
    tempView.hidden = NO;
    [containerView insertSubview:toVC.view atIndex:0];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        tempView.frame = [cell.imageView convertRect:cell.imageView.bounds toView:containerView];
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        //由于加入了手势必须判断
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {//手势取消了，原来隐藏的imageView要显示出来
            //失败了隐藏tempView，显示fromVC.imageView
            tempView.hidden = YES;
            fromVC.imageView.hidden = NO;
        }else{//手势成功，cell的imageView也要显示出来
            //成功了移除tempView，下一次pop的时候又要创建，然后显示cell的imageView
            cell.imageView.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];

}

@end
