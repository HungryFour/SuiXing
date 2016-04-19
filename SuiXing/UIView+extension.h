//
//  UIView+extension.h
//  lcf-newproject
//
//  Created by yangyang on 14-12-4.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (setFrame)


-(void)showFrame;


@property float size_width;
@property float size_height;

@property float origin_x;
@property float origin_y;

@property float center_x;
@property float center_y;

///该View所在的Controller
- (UIViewController *)viewController;
///该View的原点X值
@property (assign, nonatomic) CGFloat originX;
///该View的原点Y值
@property (assign, nonatomic) CGFloat originY;
///该View的宽度
@property (assign, nonatomic) CGFloat width;
///该View的高度
@property (assign, nonatomic) CGFloat height;
///该View的Size大小
@property (assign, nonatomic) CGSize size;
///该View的原点坐标
@property (assign, nonatomic) CGPoint origin;
///该View的原点X值+宽度
@property (assign, nonatomic) CGFloat right;
///该View的原点Y值+高度
@property (assign, nonatomic) CGFloat bottom;
/**
 *  删除所有的子类视图
 */
- (void)removeAllSubViews;
/**
 *  删除视图中特定类别的子类视图
 *
 *  @param cls 制定类别
 */
- (void)removeSubviewsWithSubviewClass:(Class)cls;
/**
 *  删除视图中特定Tag的子类视图
 *
 *  @param tag zilei
 */
- (void)removeSubviewsWithSubviewTag:(NSInteger)tag;
/**
 *  判断该View 是否 在屏幕上
 */
- (BOOL)isDisplayedInScreen;

/**
 *  连接到单击事件的接收器,并给它一个block;
 *
 *  @param block 要执行的block
 */
- (void)setTapActionWithBlock:(void (^)(void))block;


/**
 *  连接到长按事件的接收器,并给它一个block;
 *
 *  @param block 要执行的block
 */
- (void)setLongPressActionWithBlock:(void (^)(void))block;


@end

// UIView+ColorOfPoint.h
@interface UIView (ColorOfPoint)
- (UIColor *) colorOfPoint:(CGPoint)point;
@end



@interface UIView (AutoLayout)

-(void)setContraint;

@end