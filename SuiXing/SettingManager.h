//
//  SettingManager.h
//  lcf-newproject
//
//  Created by yangyang on 14-11-12.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingManager : NSObject <NSCoding>

//NSUserDefault的set，get方法

+(void)setIntValueToUserDefault:(NSInteger)intValue forKey:(NSString *)key;
+(NSInteger)getIntValueforKey:(NSString *)key;

+(void)setBoolValueToUserDefault:(BOOL)boolValue forKey:(NSString *)key;
+(BOOL)getBoolValueforKey:(NSString *)key;

+(void)setFloatValueToUserDefault:(float)floatValue forKey:(NSString *)key;
+(float)getFloatValueforKey:(NSString *)key;

+(void)setDoubleValueToUserDefault:(double)doubleValue forKey:(NSString *)key;
+(double)getDoubleValueforKey:(NSString *)key;

+(void)setArrayValueToUserDefault:(NSArray *)arrayValue forKey:(NSString *)key;
+(NSArray *)getArrayValueforKey:(NSString *)key;

+(void)setDictionaryValueToUserDefault:(NSDictionary *)dictionaryValue forKey:(NSString *)key;
+(NSDictionary *)getDictionaryValueforKey:(NSString *)key;

+(void)setDateValueToUserDefault:(NSDate *)dateValue forKey:(NSString *)key;
+(NSDate *)getDateValueforKey:(NSString *)key;

+(NSString *)getIdfvString;

//颜色转换
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;


@end