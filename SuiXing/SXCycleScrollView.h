//
//  SXCycleScrollView.h
//  SuiXing
//
//  Created by 王阳 on 16/4/6.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SXCycleScrollView;

@protocol SXCycleScrollViewDelegate <NSObject>

@optional
- (void)cycleScrollView:(SXCycleScrollView *)scrollView didSelectPage:(NSInteger)index;

@end

@protocol SXCycleScrollViewDataSource <NSObject>

- (NSInteger)numberOfPages;

@end

@interface SXCycleScrollView : UIView



@end
