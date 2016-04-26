//
//  SXIndexHeaderView.m
//  SuiXing
//
//  Created by 关静 on 16/4/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXIndexHeaderView.h"

@interface SXIndexHeaderView ()

@property (strong, nonatomic) UILabel *topLabel;
@property (strong, nonatomic) UILabel *bottomLabel;

@end

@implementation SXIndexHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _bgColor = [UIColor whiteColor];
        self.backgroundColor = _bgColor;
        [self addSubview:self.titleLabel];
        [self addSubview:self.rightLabel];
        [self updateHeaderConstrains];

    }
    return self;
}

#pragma mark - Constrains

- (void)updateHeaderConstrains{
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}


#pragma mark - Property

- (void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    self.backgroundColor = _bgColor;
}

- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc]init];
        _rightLabel.textColor = UIColorFromRGB(0x643820);
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _rightLabel;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = UIColorFromRGB(0x643820);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)topLabel{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 1)];
        _topLabel.backgroundColor = [UIColor lightGrayColor];
        _topLabel.alpha = 0.3;
    }
    return _topLabel;
}

- (UILabel *)bottomLabel{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 1)];
        _bottomLabel.backgroundColor = [UIColor lightGrayColor];
        _bottomLabel.alpha = 0.3;
    }
    return _bottomLabel;
}


@end
