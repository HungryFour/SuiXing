//
//  InfoHeaderCell.m
//  SuiXing
//
//  Created by 关静 on 16/4/19.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "InfoHeaderCell.h"

@interface InfoHeaderCell ()

@property (strong, nonatomic) UIButton *cityStrategyButton;
@property (strong, nonatomic) UIButton *townStrategyButton;

@end

@implementation InfoHeaderCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cityStrategyButton];
        [self addSubview:self.townStrategyButton];
    }
    return self;
}

#pragma mark - private method
- (void)cityButtonClick{
    NSLog(@"city click");
}

- (void)townButtonClick{
    NSLog(@"town click");
}

#pragma mark - Property

- (UIButton *)cityStrategyButton{
    if (!_cityStrategyButton) {
        _cityStrategyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_cityStrategyButton setFrame: CGRectMake(0, 0, self.bounds.size.width / 2, self.bounds.size.height)];
        [_cityStrategyButton setTitle:@"城市攻略" forState:UIControlStateNormal];
        [_cityStrategyButton addTarget:self action:@selector(cityButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _cityStrategyButton.layer.borderWidth = 1;
    }
    return _cityStrategyButton;
}

- (UIButton *)townStrategyButton{
    if (!_townStrategyButton) {
        _townStrategyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_townStrategyButton setFrame: CGRectMake(CGRectGetMaxX(self.cityStrategyButton.frame), 0, self.bounds.size.width / 2, self.bounds.size.height)];
        [_townStrategyButton setTitle:@"城镇攻略" forState:UIControlStateNormal];
        [_townStrategyButton addTarget:self action:@selector(townButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _townStrategyButton.layer.borderWidth = 1;
    }
    return _townStrategyButton;
}


@end
