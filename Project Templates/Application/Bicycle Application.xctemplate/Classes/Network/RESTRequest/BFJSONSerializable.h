//
//  BFJSONSerializable.h
//  Bicycle Framework
//
//  Created by Anton Garkusha on 21.11.12.
//  Copyright (c) 2012 Anton Garkusha. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BFJSONSerializable <NSObject>

@required
- (void)deserializeJSONValue:(id)json;

@optional
- (id)initWithJSONValue:(id)value;

@end
