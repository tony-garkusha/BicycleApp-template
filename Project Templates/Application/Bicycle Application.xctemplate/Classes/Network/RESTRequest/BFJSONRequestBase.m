//
//  BFJSONRequestBase.m
//  Bicycle Framework
//
//  Created by Anton Garkusha on 21.11.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//


#import "BFJSONRequestBase.h"

@implementation BFJSONRequestBase

- (NSData*)serializeBody:(NSDictionary*)parameters {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    
    return error ? nil : data;
}

- (NSDictionary*)headers {
    NSMutableDictionary *headers = [NSMutableDictionary dictionaryWithDictionary:[super headers]];
    [headers setValue:@"application/json" forKey:@"Content-Type"];
    return headers;
}

- (id)deserializeResponse:(NSData *)responseData {
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    return error ? nil : result;
}

@end
