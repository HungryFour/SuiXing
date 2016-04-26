//
//  HotelCell.m
//  SuiXing
//
//  Created by 关静 on 16/4/22.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "HotelCell.h"

@implementation HotelCell

- (void)awakeFromNib{
    self.frame = CGRectMake(0, 0, SX_SCREEN_WIDTH, self.frame.size.height);
}

- (void)setModel:(hotelModel *)model{
    self.hotelImageView.image = [UIImage imageNamed:model.hotelImageName];
    self.hotelName.text = model.hotelName;
    self.hotelType.text = model.hotelType;
    self.hotelPrice.text = model.hotelPrice;
    self.hotelMessage.text = model.hotelMessage;
    self.hotelLocation.text = model.hotelLocation;
}

@end
