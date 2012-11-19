//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <Foundation/Foundation.h>

typedef enum {
    ___VARIABLE_classPrefix:identifier___LogLevelNone = 0,
    ___VARIABLE_classPrefix:identifier___LogLevelDebug = 1,
    ___VARIABLE_classPrefix:identifier___LogLevelWarning = 2,
    ___VARIABLE_classPrefix:identifier___LogLevelError = 4,
    ___VARIABLE_classPrefix:identifier___LogLevelAny = 7
} ___VARIABLE_classPrefix:identifier___LogLevel;

#define ___VARIABLE_classPrefix:identifier___Log(lvl, frmt, ...) [[___VARIABLE_classPrefix:identifier___Logger sharedLogger] logWithLevel:lvl andFormat:frmt, ##__VA_ARGS__]
#define ___VARIABLE_classPrefix:identifier___LogD(frmt, ...) ___VARIABLE_classPrefix:identifier___Log(___VARIABLE_classPrefix:identifier___LogLevelDebug, frmt, ##__VA_ARGS__)
#define ___VARIABLE_classPrefix:identifier___LogW(frmt, ...) ___VARIABLE_classPrefix:identifier___Log(___VARIABLE_classPrefix:identifier___LogLevelWarning, frmt, ##__VA_ARGS__)
#define ___VARIABLE_classPrefix:identifier___LogE(frmt, ...) ___VARIABLE_classPrefix:identifier___Log(___VARIABLE_classPrefix:identifier___LogLevelError, frmt, ##__VA_ARGS__)

@interface ___VARIABLE_classPrefix:identifier___Logger : NSObject {
    NSMutableString *_mutableLogString;
}

@property (nonatomic) ___VARIABLE_classPrefix:identifier___LogLevel level;
@property (nonatomic, readonly) NSString *logString;

+ (___VARIABLE_classPrefix:identifier___Logger *)sharedLogger;

- (void)logWithLevel:(___VARIABLE_classPrefix:identifier___LogLevel)level andFormat:(NSString*)format, ... NS_FORMAT_FUNCTION(2, 3);

@end
