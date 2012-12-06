//
//  BFRESTRequestBase.h
//  Bicycle Framework
//
//  Created by Anton Garkusha on 21.11.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BFRESTRequestBase;

typedef void(^SuccessBlock)(BFRESTRequestBase*, id);
typedef void(^FailureBlock)(BFRESTRequestBase*, NSError*);

@interface BFRESTRequestBase : NSOperation <NSCopying, NSURLConnectionDataDelegate>

@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failBlock;

- (NSURL*) url;
- (NSDictionary*) parameters;
- (NSDictionary*) headers;

- (NSData*)serializeBody:(NSDictionary*)parameters;

- (NSString*)httpMethod;

- (NSURLRequest*)requestForExecution;
- (void)executeSync;
- (void)executeAsync;

- (id)deserializeResponse:(NSData*)responseData;

@end

extern NSString* const cHTTPMethodGet;
extern NSString* const cHTTPMethodPost;