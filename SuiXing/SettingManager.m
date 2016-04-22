//
//  SettingManager.m
//  lcf-newproject
//
//  Created by yangyang on 14-11-12.
//  Copyright (c) 2014年 yang. All rights reserved.
//

#import "SettingManager.h"
//#import "NSString+extention.h"

@implementation SettingManager

#pragma mark -
#pragma mark - NSUserDefault的set，get方法

+(void)removeObjcFromDefaultWithKey:(NSString *)key{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
}


+(void)setIntValueToUserDefault:(NSInteger)intValue forKey:(NSString *)key{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        [defaults setInteger:intValue forKey:key];
        [defaults synchronize];
    }
}
+(NSInteger)getIntValueforKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger intValue = 0;
    if (defaults)
        intValue = [defaults integerForKey:key];
    return intValue;
}
+(void)setBoolValueToUserDefault:(BOOL)boolValue forKey:(NSString *)key{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        [defaults setBool:boolValue forKey:key];
        [defaults synchronize];
    }
}
+(BOOL)getBoolValueforKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL boolValue = NO;
    if (defaults)
        boolValue = [defaults boolForKey:key];
    return boolValue;
}
+(void)setFloatValueToUserDefault:(float)floatValue forKey:(NSString *)key{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        [defaults setFloat:floatValue forKey:key];
        [defaults synchronize];
    }
}
+(float)getFloatValueforKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float floatValue = 0.0f;
    if (defaults)
        floatValue = [defaults floatForKey:key];
    return floatValue;
}
+(void)setDoubleValueToUserDefault:(double)doubleValue forKey:(NSString *)key{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        [defaults setDouble:doubleValue forKey:key];
        [defaults synchronize];
    }
}
+(double)getDoubleValueforKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = 0.0;
    if (defaults)
        doubleValue = [defaults doubleForKey:key];
    return doubleValue;
}
+(void)setArrayValueToUserDefault:(NSArray *)arrayValue forKey:(NSString *)key{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        NSData * arrayData = [NSKeyedArchiver archivedDataWithRootObject:arrayValue];
        [defaults setObject:arrayData forKey:key];
        [defaults synchronize];
    }
}
+(NSArray *)getArrayValueforKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray * arrayValue = nil;
    if (defaults) {
        NSData * arrayData = [defaults objectForKey:key];
        if (nil == arrayData) {
            return nil;
        }
        //NSKeyedUnarchiver 用来将NSArray,NSDictionary,NSNumber持久化存储到.plist文件中
        arrayValue = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    }
    return arrayValue;
}
+(void)setDictionaryValueToUserDefault:(NSDictionary *)dictionaryValue forKey:(NSString *)key{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        NSData * dictData = [NSKeyedArchiver archivedDataWithRootObject:dictionaryValue];
        [defaults setObject:dictData forKey:key];
        [defaults synchronize];
    }
}
+(NSDictionary *)getDictionaryValueforKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary * dictValue = nil;
    if (defaults) {
        NSData * dictData = [defaults objectForKey:key];
        if (nil == dictData) {
            return nil;
        }
        dictValue = [NSKeyedUnarchiver unarchiveObjectWithData:dictData];
    }
    return dictValue;
}
+(void)setDateValueToUserDefault:(NSDate *)dateValue forKey:(NSString *)key{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        [standardUserDefaults setObject:dateValue forKey:key];
        [standardUserDefaults synchronize];
    }
}
+(NSDate *)getDateValueforKey:(NSString *)key{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSDate *date = nil;
    if (standardUserDefaults) {
        date = [standardUserDefaults objectForKey:key];
    }
    return date;
}

+(NSString *)getIdfvString{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

#pragma mark - 颜色转换
+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}




@end
