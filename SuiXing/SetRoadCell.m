//
//  SetRoadCell.m
//  SuiXing
//
//  Created by 关静 on 16/4/21.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "SetRoadCell.h"

@interface SetRoadCell ()

@end

@implementation SetRoadCell

#pragma mark - Property

- (instancetype)init{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.leftLabel];
        [self.contentView addSubview:self.rightLabel];
    }
    return self;
}

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 200, self.bounds.size.height)];
        _leftLabel.textColor = UIColorFromRGB(0x333333);
        _leftLabel.font = [UIFont systemFontOfSize:13];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _leftLabel;
}

- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(SX_SCREEN_WIDTH - 200-30, 0, 200, self.bounds.size.height)];
        _rightLabel.textColor = UIColorFromRGB(0x333333);
        _rightLabel.font = [UIFont systemFontOfSize:13];
        _rightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightLabel;
}


@end
