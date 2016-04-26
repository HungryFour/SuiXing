//
//  HotelCell.h
//  SuiXing
//
//  Created by 关静 on 16/4/22.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotelModel.h"

@interface HotelCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *hotelImageView;
@property (weak, nonatomic) IBOutlet UILabel *hotelName;
@property (weak, nonatomic) IBOutlet UILabel *hotelLocation;
@property (weak, nonatomic) IBOutlet UILabel *hotelType;
@property (weak, nonatomic) IBOutlet UILabel *hotelMessage;
@property (weak, nonatomic) IBOutlet UILabel *hotelPrice;

@property (strong, nonatomic) hotelModel *model;

@end
