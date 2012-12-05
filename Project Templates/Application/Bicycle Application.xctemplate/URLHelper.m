//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___URLHelper.h"
//#import "___VARIABLE_classPrefix:identifier___EnvironmentSettings.h"

#define url(string) [NSURL URLWithString:string]

//#define API_SERVER_URL [___VARIABLE_classPrefix:identifier___EnvironmentSettings defaultSettings].restAPIServerURL
#define API_SERVER_URL @"some.temp.url"

@implementation ___VARIABLE_classPrefix:identifier___URLHelper

+ (NSURL*)loginURL {
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",API_SERVER_URL, @"api/login"];
    return url(urlStr);
}

@end
