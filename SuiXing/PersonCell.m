//
//  PersonCell.m
//  SuiXing
//
//  Created by 王阳 on 16/4/20.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "PersonCell.h"

@interface PersonCell ()

@property (strong, nonatomic) UILabel *manLabel;
@property (strong, nonatomic) UILabel *childLabel;


@end

@implementation PersonCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.manLabel];
        [self addSubview:self.childLabel];
        
        
        [self updatePersonView];
    }
    return self;
}

- (void)updatePersonView{
    [self.manLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).offset(10);
    }];
    
    [self.childLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.manLabel.mas_right).offset(20);
    }];
}

#pragma mark - Property

- (UILabel *)manLabel{
    if (!_manLabel) {
        _manLabel = [[UILabel alloc]init];
        _manLabel.text = @"成人";
        _manLabel.textColor = UIColorFromRGB(0x333333);
        _manLabel.font = [UIFont systemFontOfSize:15];
    }
    return _manLabel;
}

- (UILabel *)childLabel{
    if (!_childLabel) {
        _childLabel = [[UILabel alloc]init];
        _childLabel.text = @"儿童";
        _childLabel.textColor = UIColorFromRGB(0x333333);
        _childLabel.font = [UIFont systemFontOfSize:15];
    }
    return _childLabel;
}

@end
