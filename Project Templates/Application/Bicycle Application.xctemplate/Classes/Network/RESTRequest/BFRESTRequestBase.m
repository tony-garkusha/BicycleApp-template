//
//  BFRESTRequestBase.h
//  Bicycle Framework
//
//  Created by Anton Garkusha on 21.11.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//


#import "BFRESTRequestBase.h"

NSString* const cHTTPMethodGet = @"GET";
NSString* const cHTTPMethodPost = @"POST";


@interface BFRESTRequestBase ()

@property (nonatomic, strong) NSMutableData *responseData;

- (void)processSuccess;
- (void)processFail:(NSError*)error;


@end

@implementation BFRESTRequestBase

@synthesize successBlock;
@synthesize failBlock;

@synthesize responseData;


#pragma mark - NSOperation methods overriding

- (void) main {
    [self executeSync];
}

#pragma mark -

- (id)copyWithZone:(NSZone *)zone {
    BFRESTRequestBase *request = [[[self class] allocWithZone:zone] init];
    [request setSuccessBlock:self.successBlock];
    [request setFailBlock:self.failBlock];
    return request;
}

- (NSURL*) url {
    return [NSURL URLWithString:@""];
}


- (NSDictionary*) parameters {
    return [NSDictionary dictionary];
}

- (NSDictionary*) headers {
    return [NSDictionary dictionary];
}

- (NSString*)httpMethod {
    return cHTTPMethodPost;
}

- (NSData*)serializeBody:(NSDictionary*)parameters {
    return [NSData data];
}

- (NSURLRequest*)requestForExecution {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[self url]];
    
    [request setHTTPBody:[self serializeBody:[self parameters]]];
    [request setHTTPMethod:[self httpMethod]];
    
    
    NSDictionary *headers = [self headers];
    for (NSString *key in headers) {
        [request addValue:[headers valueForKey:key] forHTTPHeaderField:key];
    }
    
    if ([cHTTPMethodPost isEqualToString:request.HTTPMethod]) {
        [request addValue:[NSString stringWithFormat:@"%d", [request.HTTPBody length]] forHTTPHeaderField:@"Content-Length"];
    }

    return request;
}

- (void)executeAsync {
    @autoreleasepool {
        NSURLRequest *request = [self requestForExecution];
        
        self.responseData = [[NSMutableData alloc] init];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        [connection start];        
    }
}

- (void)executeSync {
    NSURLRequest *request = [self requestForExecution];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    self.responseData = [[NSMutableData alloc] initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error]];
    if (![self isCancelled]) {
        if (error) {
            [self processFail:error];
        } else {
            [self processSuccess];
        }
    } else {
        
    }
}

- (void)processSuccess {
    if (self.successBlock) {
        id result = [self deserializeResponse:self.responseData];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.successBlock(self, result);
        });
    }
}

- (void)processFail:(NSError *)error {
    if (self.failBlock) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.failBlock(self, error);
        });
    }
}

- (id)deserializeResponse:(NSData *)response {
    __autoreleasing NSString *result = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    return result;
}

#pragma mark - NSURLConnectionDataDelegate

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self processFail:error];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}


- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [self processSuccess];
}

@end
