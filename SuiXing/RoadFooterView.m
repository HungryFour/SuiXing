//
//  RoadFooterView.m
//  SuiXing
//
//  Created by 王阳 on 16/4/20.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "RoadFooterView.h"

@interface RoadFooterView ()


@end

@implementation RoadFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.addRoadButton];
        [self updateFooterConstrains];
    }
    return self;
}


- (void)updateFooterConstrains{
    [self.addRoadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
    }];
}

- (UIButton *)addRoadButton{
    if (!_addRoadButton) {
        _addRoadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_addRoadButton setTitle:@"点击可添加新路线" forState:UIControlStateNormal];
        _addRoadButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _addRoadButton.titleLabel.textColor = UIColorFromRGB(0x118AD2);
    }
    return _addRoadButton;
}

@end
