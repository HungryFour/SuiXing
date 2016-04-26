//
//  RoadModel.h
//  SuiXing
//
//  Created by 关静 on 16/4/20.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoadModel : NSObject

@property (strong, nonatomic) NSString *number;//人数
@property (strong, nonatomic) NSString *startPoint;//起点
@property (strong, nonatomic) NSString *endPoint;//终点
@property (strong, nonatomic) NSString *tripType;//出行方式
@property (strong, nonatomic) NSString *startTime;//出发时间
@property (strong, nonatomic) NSString *startLiveTime;//入住时间
@property (strong, nonatomic) NSString *endLiveTime;//离店时间
@property (strong, nonatomic) NSString *hotel;//酒店


@end
