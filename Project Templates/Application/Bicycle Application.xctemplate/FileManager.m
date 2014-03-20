//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___FileManager.h"

@implementation ___VARIABLE_classPrefix:identifier___FileManager

+ (___VARIABLE_classPrefix:identifier___FileManager*)sharedManger {
    static ETFileManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[___VARIABLE_classPrefix:identifier___FileManager alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (NSString*)documentsPath {        
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (BOOL)saveData:(NSData*)data atPath:(NSString*)path fileName:(NSString*)filename {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *filePath = [path stringByAppendingPathComponent:filename];
    return [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}

- (NSArray*)documentFiles {
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self documentsPath] error:nil];
}

- (NSData*)contentOfDocumentFile:(NSString*)fileName {
    NSString *filePath = [[self documentsPath] stringByAppendingPathComponent:fileName];
    return [[NSFileManager defaultManager] contentsAtPath:filePath];
}

- (BOOL)deleteDocumentFile:(NSString*)fileName {
    NSString *filePath = [[self documentsPath] stringByAppendingPathComponent:fileName];
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
    return !error;
}

@end
