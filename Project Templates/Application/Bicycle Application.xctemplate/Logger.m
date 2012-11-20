//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___Logger.h"
#import "___VARIABLE_classPrefix:identifier___DateHelper.h"

NSString* const kLogPrefixDebug = @"[DEBUG]";
NSString* const kLogPrefixWarning = @"[WARN]";
NSString* const kLogPrefixError = @"[ERROR]";


@interface ___VARIABLE_classPrefix:identifier___Logger ()

- (NSString*)prefixWithLevel:(___VARIABLE_classPrefix:identifier___LogLevel)lvl;

@end

@implementation ___VARIABLE_classPrefix:identifier___Logger

@synthesize level=_level;

+ (___VARIABLE_classPrefix:identifier___Logger *)sharedLogger {
    static ___VARIABLE_classPrefix:identifier___Logger *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[___VARIABLE_classPrefix:identifier___Logger alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        _mutableLogString = [[NSMutableString alloc] init];
    }
    return self;
}

- (void)logWithLevel:(___VARIABLE_classPrefix:identifier___LogLevel)level andFormat:(NSString*)format, ... {
    if (format && (self.level & level) == level) {
        
        NSString *realFormat = [NSString stringWithFormat:@"%@ %@",[self prefixWithLevel:level], format];
        
        va_list argumentsList;
        va_start(argumentsList, format);
        NSString *logRow = [[NSString alloc] initWithFormat:realFormat arguments:argumentsList];
        [_mutableLogString appendFormat:@"%@ %@\n", [___VARIABLE_classPrefix:identifier___DateHelper quickDateTimeString], logRow];
        NSLog(@"%@", logRow);
        va_end(argumentsList);
    }
}

- (NSString *)prefixWithLevel:(___VARIABLE_classPrefix:identifier___LogLevel)lvl {
    switch (lvl) {
        case ___VARIABLE_classPrefix:identifier___LogLevelDebug:
            return kLogPrefixDebug;
        case ___VARIABLE_classPrefix:identifier___LogLevelWarning:
            return kLogPrefixWarning;
        case ___VARIABLE_classPrefix:identifier___LogLevelError:
            return kLogPrefixError;
        case ___VARIABLE_classPrefix:identifier___LogLevelNone:
        case ___VARIABLE_classPrefix:identifier___LogLevelAny:
            return @"";
        default:
            return nil;
    }
}

- (NSString*)logString {
    NSString *result = [NSString stringWithString:_mutableLogString];
    return result;
}

@end
