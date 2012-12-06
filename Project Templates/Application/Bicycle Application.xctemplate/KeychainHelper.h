//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@class ___VARIABLE_classPrefix:identifier___User;

@interface ___VARIABLE_classPrefix:identifier___KeychainHelper : NSObject

+ (BOOL)savePassword:(NSString*)pwd forAccount:(NSString*)account;
+ (BOOL)deletePasswordForAccount:(NSString*)account;
+ (NSString*)passwordForAccount:(NSString*)account;

+ (BOOL)savePasswordForUser:(___VARIABLE_classPrefix:identifier___User*)user;
+ (NSString*)userPasswordForUsername:(NSString*)username;

@end
