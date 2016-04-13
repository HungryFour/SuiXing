//
//  SXScrollView.h
//  SuiXing
//
//  Created by 王阳 on 16/4/13.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - SXScrollViewDelegate

@protocol SXSrollViewDataSource;
@protocol SXScrollViewDelegate;

@interface SXScrollView : UIScrollView

@property (weak, nonatomic,) id<SXScrollViewDelegate> sx_delegate;
@property (weak, nonatomic, setter=setDataSource:) id<SXSrollViewDataSource> sx_dataSource;

- (void)reloadData;

@end

@protocol SXScrollViewDelegate <NSObject>

@optional
- (void)scrollView:(SXScrollView *)scrollView didClickPageAtIndex:(NSInteger)index;

@end

@protocol SXSrollViewDataSource <NSObject>

@required
- (NSInteger)numberOfPagesInScrollView:(SXScrollView *)scrollView;
- (UIView *)scrollView:(SXScrollView *)scrollView pageAtIndex:(NSInteger)index;

@end
