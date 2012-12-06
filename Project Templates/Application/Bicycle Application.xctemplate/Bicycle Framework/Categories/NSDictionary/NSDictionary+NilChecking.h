//
//  NSDictionary+NilChecking.h
//  Bicycle Framework
//
//  Created by Anton Garkusha on 05.12.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NilChecking)

- (id)nilOrValueForKey:(NSString*)key;

@end
