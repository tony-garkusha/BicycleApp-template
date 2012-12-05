//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___ApplicationFacade.h"

#import "___VARIABLE_classPrefix:identifier___User.h"

#import "BFNetworkManager.h"
#import "___VARIABLE_classPrefix:identifier___LoginRequest.h"
#import "___VARIABLE_classPrefix:identifier___LoginResult.h"

NSString* const ___VARIABLE_classPrefix:identifier___UserHasLoggedInNotification = @"___VARIABLE_classPrefix:identifier___UserHasLoggedInNotification";
NSString* const ___VARIABLE_classPrefix:identifier___UserHasLoggedOutNotification = @"___VARIABLE_classPrefix:identifier___UserHasLoggedOutNotification";


@interface ___VARIABLE_classPrefix:identifier___ApplicationFacade ()

@end

@implementation ___VARIABLE_classPrefix:identifier___ApplicationFacade

+ (___VARIABLE_classPrefix:identifier___ApplicationFacade*)sharedFacade {
    static ___VARIABLE_classPrefix:identifier___ApplicationFacade *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[___VARIABLE_classPrefix:identifier___ApplicationFacade alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)logInWithUsername:(NSString*)username andPassword:(NSString*)pwd failCompletion:(void (^)(NSError*))failBlock {
    
    ___VARIABLE_classPrefix:identifier___LoginRequest *loginRequest = [[___VARIABLE_classPrefix:identifier___LoginRequest alloc] initWithUsername:username andPassword:pwd];
    
    loginRequest.successBlock = ^(BFRESTRequestBase* request, id result) {
        ___VARIABLE_classPrefix:identifier___LoginResult *loginResult = (___VARIABLE_classPrefix:identifier___LoginResult*)result;
        if (loginResult == nil) {
            if (failBlock) {
                NSError *error = [NSError errorWithCode:0 andDescription:@"We have some problems with parsing response from server"];
                failBlock(error);
            }
        }else if (!loginResult.isSucceed) {
            if (failBlock) {
                NSError *error = [NSError errorWithCode:0 andDescription:@"Wrong credentials"];
                failBlock(error);
            }
        } else {
            ___VARIABLE_classPrefix:identifier___User *newUser = [[___VARIABLE_classPrefix:identifier___User alloc] init];
            newUser.username = username;
            newUser.password = pwd;
            newUser.isLoggedIn = loginResult.isSucceed;
            
            self.currentUser = newUser;
            [[NSNotificationCenter defaultCenter] postNotificationName:___VARIABLE_classPrefix:identifier___UserHasLoggedInNotification object:newUser];
        }
    };
    
    if (failBlock) {
        loginRequest.failBlock = ^(BFRESTRequestBase* request, NSError* error) {
            failBlock(error);
        };
    }
    
    [[BFNetworkManager sharedManager] addRequest:loginRequest];
}

- (void)logOut {
    ___VARIABLE_classPrefix:identifier___User *loggedOutUser = self.currentUser;
    self.currentUser = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:___VARIABLE_classPrefix:identifier___UserHasLoggedOutNotification object:loggedOutUser];
}

@end
