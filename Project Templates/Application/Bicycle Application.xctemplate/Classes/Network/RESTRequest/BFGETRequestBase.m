//
//  BFGETRequestBase.m
//  Bicycle Framework
//
//  Created by Anton Garkusha on 21.11.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import "BFGETRequestBase.h"

static NSString* const cURLParametersDelimiter = @"?";
static NSString* const cParametersDelimiter = @"&";
static NSString* const cKeyValueDelimiter = @"=";

@implementation BFGETRequestBase


- (NSString*)httpMethod {
    return cHTTPMethodGet;
}

- (NSURLRequest*)requestForExecution {
    
    NSMutableString *parametersString = [NSMutableString string];
    NSDictionary *params = [self parameters];
    [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *escKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *escVal = [obj stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [parametersString appendFormat:@"%@%@%@%@",escKey, cKeyValueDelimiter, escVal, cParametersDelimiter];
    }];
    [parametersString deleteCharactersInRange:NSMakeRange([parametersString length] - 1, 1)];
    NSString *fullURLStr = [NSString stringWithFormat:@"%@%@%@",[self url], cURLParametersDelimiter, parametersString];
    NSURL *fullURL = [NSURL URLWithString:fullURLStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:fullURL];
    
    [request setHTTPBody:nil];
    [request setHTTPMethod:[self httpMethod]];
    
    
    NSDictionary *headers = [self headers];
    for (NSString *key in headers) {
        [request addValue:[headers valueForKey:key] forHTTPHeaderField:key];
    }
    return request;
}

@end
