//
//  RoadCell.m
//  SuiXing
//
//  Created by 王阳 on 16/4/20.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "RoadCell.h"

@interface RoadCell ()

@property (strong, nonatomic) UIView *cityView;
@property (strong, nonatomic) UILabel *originCityLabel;
@property (strong, nonatomic) UILabel *toCityLabel;
@property (strong, nonatomic) UILabel *lineLabel;

@property (strong, nonatomic) UIView *timeView;
@property (strong, nonatomic) UIView *hotelView;
@property (strong, nonatomic) UIView *tripView;

@end

@implementation RoadCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.cityView];
        [self addSubview:self.timeView];
        [self addSubview:self.hotelView];
        [self addSubview:self.tripView];
        
        [self updateRoadView];
    }
    return self;
}

- (void)updateRoadView{
    [self.originCityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cityView.mas_centerY);
        make.left.equalTo(self.cityView.mas_left).offset(20);
    }];
    
    [self.toCityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cityView.mas_centerY);
        make.right.equalTo(self.cityView.mas_right).offset(-20);
    }];
    
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cityView.mas_centerY).priorityLow();
        make.left.equalTo(self.originCityLabel.mas_right).offset(30).priorityLow();
        make.right.equalTo(self.toCityLabel.mas_left).offset(30).priorityLow();
        make.height.equalTo(@1).priorityLow();
    }];
}

#pragma mark - Property

- (UIView *)cityView{
    if (!_cityView) {
        _cityView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height / 4)];
        [_cityView addSubview:self.originCityLabel];
        [_cityView addSubview:self.toCityLabel];
        [_cityView addSubview:self.lineLabel];
        _cityView.backgroundColor = [UIColor redColor];
    }
    return _cityView;
}

- (UILabel *)originCityLabel{
    if (!_originCityLabel) {
        _originCityLabel = [[UILabel alloc]init];
        _originCityLabel.textColor = UIColorFromRGB(0x333333);
        _originCityLabel.font = [UIFont systemFontOfSize:18];
        _originCityLabel.text = @"北京";
    }
    return _originCityLabel;
}

- (UILabel *)toCityLabel{
    if (!_toCityLabel) {
        _toCityLabel = [[UILabel alloc]init];
        _toCityLabel.textColor = UIColorFromRGB(0x333333);
        _toCityLabel.font = [UIFont systemFontOfSize:18];
        _toCityLabel.text = @"上海";
    }
    return _toCityLabel;
}

- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = UIColorFromRGB(0x333333);
    }
    return _lineLabel;
}



- (UIView *)timeView{
    if (!_timeView) {
        _timeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cityView.frame), self.bounds.size.width, self.bounds.size.height / 4)];
        _timeView.backgroundColor = [UIColor greenColor];
    }
    return _timeView;
}

- (UIView *)hotelView{
    if (!_hotelView) {
        _hotelView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.timeView.frame), self.bounds.size.width, self.bounds.size.height / 4)];
        _hotelView.backgroundColor = [UIColor yellowColor];
    }
    return _hotelView;
}

- (UIView *)tripView{
    if (!_tripView) {
        _tripView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.hotelView.frame), self.bounds.size.width, self.bounds.size.height / 4)];
        _tripView.backgroundColor = [UIColor blueColor];
    }
    return _tripView;
}

@end
