//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___LoginResult.h"
#import "NSDictionary+NilChecking.h"
#import "___VARIABLE_classPrefix:identifier___RESTConstants.h"

@implementation ___VARIABLE_classPrefix:identifier___LoginResult

#pragma mark - JSONSerializable

- (id) initWithJSONValue:(id)value {
    self = [super init];
    if (self) {
        [self deserializeJSONValue:value];
    }
    return self;
}

- (void) deserializeJSONValue:(id)json {
    if ([json isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary*)json;
        self.isSucceed = [[dict nilOrValueForKey:kSuccess] boolValue];
    }
}

@end
