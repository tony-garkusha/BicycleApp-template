//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@class ___VARIABLE_classPrefix:identifier___User;

@interface ___VARIABLE_classPrefix:identifier___ApplicationFacade : NSObject

@property (nonatomic, strong) ___VARIABLE_classPrefix:identifier___User *currentUser;

+ (___VARIABLE_classPrefix:identifier___ApplicationFacade*)sharedFacade;
- (void)logInWithUsername:(NSString*)username andPassword:(NSString*)pwd failCompletion:(void (^)(NSError*))failBlock;
- (void)logOut;

@end

extern NSString* const ___VARIABLE_classPrefix:identifier___UserHasLoggedInNotification;
extern NSString* const ___VARIABLE_classPrefix:identifier___UserHasLoggedOutNotification;