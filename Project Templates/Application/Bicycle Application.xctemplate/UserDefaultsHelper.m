//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___UserDefaultsHelper.h"

#import "___VARIABLE_classPrefix:identifier___User.h"

#define StandardUserDefaults [NSUserDefaults standardUserDefaults]

#define kLastUser @"kLastUser"
#define kUsername @"kUsername"
#define kPassword @"kPassword"

@implementation ___VARIABLE_classPrefix:identifier___UserDefaultsHelper

+ (void)synchronize {
    [StandardUserDefaults synchronize];
}

+ (void)setLastUser:(___VARIABLE_classPrefix:identifier___User*)user secure:(BOOL)isSecure {
    
    if (user) {
        NSMutableDictionary *userDictionary = [NSMutableDictionary dictionaryWithDictionary:@{kUsername : user.username}];
        
        if (!isSecure) {
            [userDictionary setObject:user.password forKey:kPassword];
        }
        
        [StandardUserDefaults setObject:userDictionary forKey:kLastUser];
    } else {
        [StandardUserDefaults removeObjectForKey:kLastUser];
    }
    [[self class] synchronize];
}

+ (___VARIABLE_classPrefix:identifier___User*)lastUser {
    NSDictionary *userDict = [StandardUserDefaults objectForKey:kLastUser];
    ___VARIABLE_classPrefix:identifier___User *user = nil;
    if (userDict) {
        user = [[___VARIABLE_classPrefix:identifier___User alloc] init];
        user.username = [userDict objectForKey:kUsername];
        user.password = [userDict objectForKey:kPassword];
    }
    
    return user;
}

@end
