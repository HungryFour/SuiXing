//
//  SXIndexHeaderView.m
//  SuiXing
//
//  Created by 王阳 on 16/4/14.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SXIndexHeaderView.h"

@interface SXIndexHeaderView ()

@property (strong, nonatomic) UIImageView *rightView;
@property (strong, nonatomic) UILabel *topLabel;
@property (strong, nonatomic) UILabel *bottomLabel;

@end

@implementation SXIndexHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.rightView];
        [self addSubview:self.topLabel];
        [self addSubview:self.bottomLabel];
        [self updateHeaderConstrains];

    }
    return self;
}

#pragma mark - Constrains

- (void)updateHeaderConstrains{
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}


#pragma mark - Property

- (UIImageView *)rightView{
    if (!_rightView) {
        _rightView = [[UIImageView alloc]init];
    }
    return _rightView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = UIColorFromRGB(0x666666);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
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
