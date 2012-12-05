//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "BFJSONRequestBase.h"

@interface ___VARIABLE_classPrefix:identifier___LoginRequest : BFJSONRequestBase

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

- (id)initWithUsername:(NSString*)username andPassword:(NSString*)pwd;

@end
