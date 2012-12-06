//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@class ___VARIABLE_classPrefix:identifier___User;

@interface ___VARIABLE_classPrefix:identifier___UserDefaultsHelper : NSObject

+ (void)synchronize;

+ (___VARIABLE_classPrefix:identifier___User*)lastUser;
+ (void)setLastUser:(___VARIABLE_classPrefix:identifier___User*)user secure:(BOOL)isSecure;

@end
