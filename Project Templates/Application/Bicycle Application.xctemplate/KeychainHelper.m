//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___KeychainHelper.h"

#import "___VARIABLE_classPrefix:identifier___User.h"

#define kAccessGroup @"___APPIDENTIFIER___"

@interface ___VARIABLE_classPrefix:identifier___KeychainHelper ()

+ (NSDictionary*)secureItemQueryTemplate;
+ (NSDictionary*)secureItemTemplate;

@end

@implementation ___VARIABLE_classPrefix:identifier___KeychainHelper

+ (NSDictionary*)secureItemQueryTemplate {
    return @{(__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrAccessGroup : kAccessGroup,
        (__bridge id)kSecMatchLimit : (__bridge id)kSecMatchLimitOne,
        (__bridge id)kSecReturnAttributes : (__bridge id)kCFBooleanTrue};
    
}

+ (NSDictionary*)secureItemTemplate {
    return @{(__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
    (__bridge id)kSecAttrAccessGroup : kAccessGroup};
    
}



+ (BOOL)savePassword:(NSString*)pwd forAccount:(NSString*)account {
    NSMutableDictionary *queryDict = [NSMutableDictionary dictionaryWithDictionary:[[self class] secureItemQueryTemplate]];
    [queryDict setObject:account forKey:(__bridge id)kSecAttrAccount];
    
    NSDictionary *itemDict = NULL;
    CFTypeRef itemDictRef = (__bridge CFTypeRef) itemDict;
    
    OSStatus result;
    
    NSDictionary *tempQuery = [NSDictionary dictionaryWithDictionary:queryDict];
    
    OSStatus tempResult = SecItemCopyMatching((__bridge CFDictionaryRef)tempQuery, &itemDictRef);
    
    if (tempResult == errSecSuccess) {
        
        NSMutableDictionary *updQueryDict = [NSMutableDictionary dictionaryWithDictionary:[[self class] secureItemTemplate]];
        [updQueryDict setObject:account forKey:(__bridge id)kSecAttrAccount];
        NSDictionary *tempUpdQuery = [NSDictionary dictionaryWithDictionary:updQueryDict];
        
        NSDictionary *updAttributes = @{(__bridge id)kSecAttrGeneric : pwd};
        
        result = SecItemUpdate((__bridge CFDictionaryRef)tempUpdQuery, (__bridge CFDictionaryRef)updAttributes);
        
    } else {
        
        NSMutableDictionary *mutableAddDict = [NSMutableDictionary dictionaryWithDictionary:[[self class] secureItemTemplate]];
        [mutableAddDict setObject:account forKey:(__bridge id)kSecAttrAccount];        
        [mutableAddDict setObject:pwd forKey:(__bridge id)kSecAttrGeneric];
        
        NSDictionary *addQuery = [NSDictionary dictionaryWithDictionary:mutableAddDict];
        result = SecItemAdd((__bridge CFDictionaryRef)addQuery, NULL);
    }
    
    return result == errSecSuccess;
}

+ (BOOL)deletePasswordForAccount:(NSString*)account {
    NSMutableDictionary *queryDict = [NSMutableDictionary dictionaryWithDictionary:[[self class] secureItemTemplate]];
    [queryDict setObject:account forKey:(__bridge id)kSecAttrAccount];
    
    NSDictionary *tempQuery = [NSDictionary dictionaryWithDictionary:queryDict];
    
    OSStatus result = SecItemDelete((__bridge CFDictionaryRef)tempQuery);
    
    return result == errSecSuccess;
}

+ (NSString*)passwordForAccount:(NSString*)account {
    NSMutableDictionary *queryDict = [NSMutableDictionary dictionaryWithDictionary:[[self class] secureItemQueryTemplate]];
    [queryDict setObject:account forKey:(__bridge id)kSecAttrAccount];
    
    NSDictionary *itemDict = NULL;
    CFTypeRef itemDictRef = (__bridge CFTypeRef) itemDict;
    
    NSString *result;
    
    if (SecItemCopyMatching((__bridge CFDictionaryRef)queryDict, &itemDictRef) == errSecSuccess) {
        itemDict = (__bridge NSDictionary*)itemDictRef;
        result = [itemDict objectForKey:(__bridge id)kSecAttrGeneric];
        return result;
    }
    
    return nil;
}

+ (BOOL)savePasswordForUser:(___VARIABLE_classPrefix:identifier___User*)user {
    //Use location ID and username as account field for the keychain item
    NSString *account = user.username;
    return [[self class] savePassword:user.password forAccount:account];
}

+ (NSString*)userPasswordForUsername:(NSString*)username {
    NSString *account = username;
    return [[self class] passwordForAccount:account];
}

@end
