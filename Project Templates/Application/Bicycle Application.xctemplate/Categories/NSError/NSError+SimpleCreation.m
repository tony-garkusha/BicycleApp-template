//
//  NSError+SimpleCreation.m
//  Bicycle Framework
//
//  Created by Anton Garkusha on 05.12.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import "NSError+SimpleCreation.h"

//TODO: Change error domain
NSString *const kAppErrorDomain = @"___basic_app_domain___";

@implementation NSError (SimpleCreation)

+ (NSError*)errorWithCode:(NSInteger)code andDescription:(NSString*)description {
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%@" ,description] forKey:NSLocalizedDescriptionKey];
    __autoreleasing NSError* error = [[NSError alloc] initWithDomain:kAppErrorDomain code:code userInfo:dict];
    return error;
}

@end
