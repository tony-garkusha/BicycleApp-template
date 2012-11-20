//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@interface ___VARIABLE_classPrefix:identifier___DateHelper : NSObject

+ (NSString*)quickDateTimeString;
+ (NSString*)quickDateString;
+ (NSString*)quickTimeString;

+ (NSString*)quickDateTimeStringWithDate:(NSDate*)date;
+ (NSString*)quickDateStringWithDate:(NSDate*)date;
+ (NSString*)quickTimeStringWithDate:(NSDate*)date;

@end
