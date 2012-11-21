//
//  BFNetworkManager.h
//  Bicycle Framework
//
//  Created by Anton Garkusha on 21.11.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BFRESTRequestBase.h"

@interface BFNetworkManager : NSObject {
    
    NSArray *_savedRequestOperations;
}

+ (BFNetworkManager *)sharedManager;

- (void)start;
- (void)restart;
- (void)pause;
- (void)stop;

- (void)addRequest:(BFRESTRequestBase*)request;
- (void)cancelRequest:(BFRESTRequestBase*)request;

@end
