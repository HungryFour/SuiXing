//
//  RoadCell.m
//  SuiXing
//
//  Created by 关静 on 16/4/20.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "RoadCell.h"

@interface RoadCell ()

@property (strong, nonatomic) UIView *roadView;

@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UILabel *startTimeLabel;
@property (strong, nonatomic) UILabel *tripTypeLabel;
@property (strong, nonatomic) UILabel *hotelLabel;
@property (strong, nonatomic) UILabel *startLiveLabel;
@property (strong, nonatomic) UILabel *endLiveLabel;
@property (strong, nonatomic) UILabel *totalTimeLabel;


@end

@implementation RoadCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.roadView];
        [self.roadView addSubview:self.numberLabel];
        [self.roadView addSubview:self.startTimeLabel];
        [self.roadView addSubview:self.tripTypeLabel];
        [self.roadView addSubview:self.hotelLabel];
        [self.roadView addSubview:self.startLiveLabel];
        [self.roadView addSubview:self.endLiveLabel];
        [self.roadView addSubview:self.totalTimeLabel];
        [self.roadView addSubview:self.editButton];
        
    }
    return self;
}

#pragma mark - Property

- (void)setModel:(RoadModel *)model{
    self.numberLabel.text = [NSString stringWithFormat:@"人数：%@",model.number];
    self.startTimeLabel.text = [NSString stringWithFormat:@"出行时间：%@",model.startTime];
    self.tripTypeLabel.text = [NSString stringWithFormat:@"行乘方式：%@",model.tripType];
    self.hotelLabel.text = [NSString stringWithFormat:@"酒店：%@",model.hotel];
    self.startLiveLabel.text = [NSString stringWithFormat:@"入住时间：%@",model.startLiveTime];
    self.endLiveLabel.text = [NSString stringWithFormat:@"离店时间：%@",model.endLiveTime];
    
    self.totalTimeLabel.text = [NSString stringWithFormat:@"共计：%ld天",[self compareDate:model.startLiveTime compareDate:model.endLiveTime]];
}

-(NSInteger) compareDate:(NSString *)date compareDate:(NSString *) compareDate
{

    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromdate=[format dateFromString:date];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    NSLog(@"fromdate=%@",fromDate);

    NSDate *toDate = [format dateFromString:compareDate];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: toDate];
    NSDate *localeDate = [toDate  dateByAddingTimeInterval: interval];
    NSLog(@"enddate=%@",localeDate);
    NSDateComponents *components = [gregorian components:unitFlags fromDate:fromDate toDate:localeDate options:0];
    NSInteger months = [components month];
    NSInteger days = [components day];//年[components year]
    NSLog(@"month=%ld",months);
    NSLog(@"days=%ld",days);

    return days;
}

-(UIView *)roadView{
    if (!_roadView) {
        _roadView = [[UIView alloc]initWithFrame:CGRectMake(20, 10, SX_SCREEN_WIDTH - 40, self.bounds.size.height - 20)];
        _roadView.backgroundColor  = [UIColor whiteColor];
        _roadView.layer.borderWidth = 1;
        _roadView.layer.borderColor = UIColorFromRGB(0x999999).CGColor;
        _roadView.layer.cornerRadius = 5;
        _roadView.layer.masksToBounds = YES;

    }
    return _roadView;
}

- (UILabel *)numberLabel{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, self.roadView.size.height / 6)];
        NSLog(@"height = %f",self.roadView.size.height / 6);
        _numberLabel.textColor = UIColorFromRGB(0x333333);
        _numberLabel.font = [UIFont systemFontOfSize:13];
        _numberLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _numberLabel;
}

- (UILabel *)startTimeLabel{
    if (!_startTimeLabel) {
        _startTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.numberLabel.frame), CGRectGetWidth(self.roadView.frame), self.roadView.size.height / 7)];
        _startTimeLabel.textColor = UIColorFromRGB(0x333333);
        _startTimeLabel.font = [UIFont systemFontOfSize:13];
        _startTimeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _startTimeLabel;
}

- (UILabel *)tripTypeLabel{
    if (!_tripTypeLabel) {
        _tripTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.startTimeLabel.frame), CGRectGetWidth(self.roadView.frame), self.roadView.size.height / 7)];
        _tripTypeLabel.textColor = UIColorFromRGB(0x333333);
        _tripTypeLabel.font = [UIFont systemFontOfSize:13];
        _tripTypeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _tripTypeLabel;
}

- (UILabel *)hotelLabel{
    if (!_hotelLabel) {
        _hotelLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.tripTypeLabel.frame), CGRectGetWidth(self.roadView.frame), self.roadView.size.height / 7)];
        _hotelLabel.textColor = UIColorFromRGB(0x333333);
        _hotelLabel.font = [UIFont systemFontOfSize:13];
        _hotelLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _hotelLabel;
}

- (UILabel *)startLiveLabel{
    if (!_startLiveLabel) {
        _startLiveLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.hotelLabel.frame), CGRectGetWidth(self.roadView.frame), self.roadView.size.height / 7)];
        _startLiveLabel.textColor = UIColorFromRGB(0x333333);
        _startLiveLabel.font = [UIFont systemFontOfSize:13];
        _startLiveLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _startLiveLabel;
}

- (UILabel *)endLiveLabel{
    if (!_endLiveLabel) {
        _endLiveLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.startLiveLabel.frame), CGRectGetWidth(self.roadView.frame), self.roadView.size.height / 7)];
        _endLiveLabel.textColor = UIColorFromRGB(0x333333);
        _endLiveLabel.font = [UIFont systemFontOfSize:13];
        _endLiveLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _endLiveLabel;
}

- (UILabel *)totalTimeLabel{
    if (!_totalTimeLabel) {
        _totalTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.endLiveLabel.frame), CGRectGetWidth(self.roadView.frame), self.roadView.size.height / 7)];
        _totalTimeLabel.textColor = UIColorFromRGB(0x333333);
        _totalTimeLabel.font = [UIFont systemFontOfSize:13];
        _totalTimeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _totalTimeLabel;
}

- (UIButton *)editButton{
    if (!_editButton) {
        _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editButton setFrame:CGRectMake(self.roadView.frame.size.width - 10 - 50, 5, 50, self.roadView.size.height / 7 - 10)];
        [_editButton setTitle:@"编辑" forState:UIControlStateNormal];
        _editButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _editButton.titleLabel.textColor = UIColorFromRGB(0xffffff);
        _editButton.backgroundColor = UIColorFromRGB(0x118AD2);
        
    }
    return _editButton;
}


@end
