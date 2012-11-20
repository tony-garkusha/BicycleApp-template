//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___DateHelper.h"

@implementation ___VARIABLE_classPrefix:identifier___DateHelper

+ (NSString*)quickDateTimeString {
    return [[self class] quickDateTimeStringWithDate:[NSDate date]];
}

+ (NSString*)quickDateTimeStringWithDate:(NSDate*)date {
    static NSDateFormatter *quickDateTimeFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        quickDateTimeFormatter = [[NSDateFormatter alloc] init];
        [quickDateTimeFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss'.'SSS"];
    });
    return [quickDateTimeFormatter stringFromDate:date];
}

+ (NSString*)quickDateString {
    return [[self class] quickDateStringWithDate:[NSDate date]];
}

+ (NSString*)quickDateStringWithDate:(NSDate*)date {
    static NSDateFormatter *quickDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        quickDateFormatter = [[NSDateFormatter alloc] init];
        [quickDateFormatter setDateFormat:@"yyyy-MM-dd"];
    });
    return [quickDateFormatter stringFromDate:date];
}

+ (NSString*)quickTimeString {
    return [[self class] quickTimeStringWithDate:[NSDate date]];
}


+ (NSString*)quickTimeStringWithDate:(NSDate*)date {
    static NSDateFormatter *quickTimeFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        quickTimeFormatter = [[NSDateFormatter alloc] init];
        [quickTimeFormatter setDateFormat:@"yyyy-MM-dd"];
    });
    return [quickTimeFormatter stringFromDate:date];
}

@end
