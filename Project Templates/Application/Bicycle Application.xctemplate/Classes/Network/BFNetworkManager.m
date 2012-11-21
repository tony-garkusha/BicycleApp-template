//
//  BFNetworkManager.h
//  Bicycle Framework
//
//  Created by Anton Garkusha on 21.11.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import "BFNetworkManager.h"

@interface BFNetworkManager ()

@property (nonatomic, strong) NSOperationQueue *queue;

- (void)updateActivityIndicator;

@end

@implementation BFNetworkManager

@synthesize queue=_queue;


+ (BFNetworkManager *)sharedManager {
    static BFNetworkManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BFNetworkManager alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (id)init {
    
    self = [super init];
    if (self) {
        _savedRequestOperations = nil;
        _queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)start {
    [self.queue setSuspended:NO];
}

- (void)restart {
    
    [self.queue setSuspended:NO];
    if (_savedRequestOperations) {
        for (BFRESTRequestBase *request in _savedRequestOperations) {
            [self addRequest:request];
        }
    }
    _savedRequestOperations = nil;
}

- (void)pause {
    _savedRequestOperations = [[NSArray alloc] initWithArray:[_queue operations] copyItems:YES];
    [self.queue cancelAllOperations];
    [self.queue setSuspended:YES];
    [self updateActivityIndicator];
}

- (void)stop {
    _savedRequestOperations = nil;
    [self.queue cancelAllOperations];
    [self.queue setSuspended:YES];
    [self updateActivityIndicator];
}

- (void)addRequest:(BFRESTRequestBase*)request {
    
    if ([[_queue operations] containsObject:request]) {
        return;
    }
    
    NSOperation *operation = request;
    [operation setCompletionBlock:^{
        [self updateActivityIndicator];
    }];
    [_queue addOperation:operation];
    
    [self updateActivityIndicator];
}

- (void)cancelRequest:(BFRESTRequestBase*)request {
    @synchronized (self) {
        NSOperation *operation = [[_queue operations] containsObject:request] ? request : nil;
        if (operation) {
            [operation cancel];
            [self updateActivityIndicator];
        }
    }
}

- (void)updateActivityIndicator {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:[_queue operationCount] > 0];
}

@end
