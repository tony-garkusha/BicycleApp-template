//
//  NSError+SimpleCreation.h
//  Bicycle Framework
//
//  Created by Anton Garkusha on 05.12.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (SimpleCreation)

+ (NSError*)errorWithCode:(NSInteger)code andDescription:(NSString*)description;

@end

extern NSString *const kAppErrorDomain;