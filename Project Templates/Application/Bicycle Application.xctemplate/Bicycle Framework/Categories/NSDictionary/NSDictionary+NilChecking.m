//
//  NSDictionary+NilChecking.m
//  Bicycle Framework
//
//  Created by Anton Garkusha on 05.12.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import "NSDictionary+NilChecking.h"

@implementation NSDictionary (NilChecking)

- (id)nilOrValueForKey:(NSString*)key {
    id value = [self valueForKey:key];
    return [value isKindOfClass:[NSNull class]] ? nil : value;
}

@end
