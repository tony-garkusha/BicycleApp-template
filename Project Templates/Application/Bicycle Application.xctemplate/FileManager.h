//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <Foundation/Foundation.h>

@interface ___VARIABLE_classPrefix:identifier___FileManager : NSObject

+ (___VARIABLE_classPrefix:identifier___FileManager*)sharedManger;

- (BOOL)saveData:(NSData*)data atPath:(NSString*)path fileName:(NSString*)filename;

- (NSArray*)documentFiles;
- (NSData*)contentOfDocumentFile:(NSString*)fileName;
- (BOOL)deleteDocumentFile:(NSString*)fileName;

- (NSString*)documentsPath;

@end