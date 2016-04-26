//
//  TopicRoadCell.m
//  SuiXing
//
//  Created by 关静 on 16/4/13.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "TopicRoadCell.h"

@interface TopicRoadCell ()


@end

@implementation TopicRoadCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.imageNameLabel];
        [self updateLabelConstraint];
    }
    return self;
}

- (void)updateLabelConstraint{
    [self.imageNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
    }];
}

- (UILabel *)imageNameLabel{
    if (!_imageNameLabel) {
        _imageNameLabel = [[UILabel alloc]init];
        _imageNameLabel.textColor = UIColorFromRGB(0xffffff);
        _imageNameLabel.font = [UIFont systemFontOfSize:18];
    }
    return _imageNameLabel;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _imageView.contentMode = UIViewContentModeScaleToFill;
        
    }
    return _imageView;
}

@end
