//
//  BFPOSTRequestBase.m
//  Bicycle Framework
//
//  Created by Anton Garkusha on 21.11.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import "BFPOSTRequestBase.h"

static NSString* const cParametersDelimiter = @"&";
static NSString* const cKeyValueDelimiter = @"=";

@implementation BFPOSTRequestBase

- (NSData*)serializeBody:(NSDictionary*)parameters {
    NSMutableString *postStr = [NSMutableString string];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [postStr appendFormat:@"%@%@%@%@",key, cKeyValueDelimiter, obj, cParametersDelimiter];
    }];
    [postStr deleteCharactersInRange:NSMakeRange([postStr length] - 1, 1)];
    NSData *data = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}


@end
