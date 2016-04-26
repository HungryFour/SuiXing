//
//  RoadFooterView.m
//  SuiXing
//
//  Created by 关静 on 16/4/20.
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
        [self addSubview:self.commitButton];
        [self updateFooterConstrains];
    }
    return self;
}


- (void)updateFooterConstrains{
    [self.addRoadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    
    [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addRoadButton.mas_bottom).offset(10);
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
}

- (UIButton *)addRoadButton{
    if (!_addRoadButton) {
        _addRoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addRoadButton setTitle:@"添加中转站" forState:UIControlStateNormal];
        _addRoadButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _addRoadButton.titleLabel.textColor = UIColorFromRGB(0xffffff);
        _addRoadButton.backgroundColor = UIColorFromRGB(0x118AD2);

    }
    return _addRoadButton;
}

- (UIButton *)commitButton{
    if (!_commitButton) {
        _commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commitButton setTitle:@"提交订单" forState:UIControlStateNormal];
        _commitButton.titleLabel.font = [UIFont systemFontOfSize:20];
        _commitButton.titleLabel.textColor = UIColorFromRGB(0xffffff);
        _commitButton.backgroundColor = UIColorFromRGB(0x118AD2);
    }
    return _commitButton;
}

@end
