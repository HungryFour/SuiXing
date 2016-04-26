//
//  RoadCell.h
//  SuiXing
//
//  Created by 关静 on 16/4/20.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoadModel.h"

@interface RoadCell : UICollectionViewCell

@property (strong, nonatomic) RoadModel *model;
@property (strong, nonatomic) UIButton *editButton;

@end
