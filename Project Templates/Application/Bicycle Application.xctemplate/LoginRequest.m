//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___LoginRequest.h"
#import "___VARIABLE_classPrefix:identifier___RESTConstants.h"
#import "___VARIABLE_classPrefix:identifier___URLHelper.h"
#import "___VARIABLE_classPrefix:identifier___LoginResult.h"

@implementation ___VARIABLE_classPrefix:identifier___LoginRequest

- (id)initWithUsername:(NSString*)username andPassword:(NSString*)pwd {
    self = [super init];
    if (self) {
        _username = [username copy];
        _password = [pwd copy];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    ___VARIABLE_classPrefix:identifier___LoginRequest *request = [super copyWithZone:zone];
    request.username = self.username;
    request.password = self.password;
    return request;
}

- (NSDictionary*)parameters {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[super parameters]];
    [params setValue:self.username forKey:kLogin];
    [params setValue:self.password forKey:kPassword];
    return params;
}

- (NSURL *)url {
    return [___VARIABLE_classPrefix:identifier___URLHelper loginURL];
}

- (id)deserializeResponse:(NSData *)responseData {
    id dict = [super deserializeResponse:responseData];
    if (dict) {
        ___VARIABLE_classPrefix:identifier___LoginResult *result = [[___VARIABLE_classPrefix:identifier___LoginResult alloc] initWithJSONValue:dict];
        return result;
    }
    return nil;
}

@end
