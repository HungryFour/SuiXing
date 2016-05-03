//
//  SXPlusButtonSubclass.h
//  SuiXing
//
//  Created by 王阳 on 16/4/28.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "CYLPlusButton.h"

@protocol PlusButtonClick <NSObject>

- (void)PlusButtonClickWithIndex:(NSInteger)index;

@end

@interface SXPlusButtonSubclass : CYLPlusButton <CYLPlusButtonSubclassing>

@property (weak, nonatomic) id<PlusButtonClick> delegate;

@end
