//
//  Utilities.m
//  customDelegateDemo
//
//  Created by Aditya Kumar on 10/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities
+ (NSString*)getDocumentDirectoryPath
{
    NSArray* path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentPath = [path objectAtIndex:0];
    NSString* plistPath = [documentPath stringByAppendingString:@"ContactData.plist"];
    return plistPath;
}
@end
