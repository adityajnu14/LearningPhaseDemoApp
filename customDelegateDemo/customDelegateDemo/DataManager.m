//
//  DataManager.m
//  customDelegateDemo
//
//  Created by Aditya Kumar on 10/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "Utilities.h"
#import "DataManager.h"

@implementation DataManager
+(instancetype)dataManager
{
    static DataManager* sSharedManager = nil;
    static dispatch_once_t sOnceToken;
    dispatch_once(&sOnceToken, ^{
        sSharedManager = [[DataManager alloc]init];
    });
    return  sSharedManager;
}

+ (BOOL)saveContactDataToPlistWithName:(NSString*)contactName contact:(NSString*)contactNo

{
    NSString* plistPath = [Utilities getDocumentDirectoryPath];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSMutableArray* dataFromPlist;
    if(![fileManager fileExistsAtPath:plistPath])
    {
        dataFromPlist = [[NSMutableArray alloc]init];
    }
    else
    {
        dataFromPlist = [NSMutableArray arrayWithContentsOfFile:plistPath];
    }
    NSDictionary* aDict = [NSDictionary dictionaryWithObjectsAndKeys:contactName,@"name",contactNo,@"number",nil];
    [dataFromPlist addObject:aDict];
    BOOL didWriteToFile = [dataFromPlist writeToFile:plistPath atomically:YES];
    return didWriteToFile;
}

+ (NSMutableArray*)getContactDataFromPlist
{
    NSString* plistPath = [Utilities getDocumentDirectoryPath];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSMutableArray* dataFromPlist;
    if(![fileManager fileExistsAtPath:plistPath])
    {
        dataFromPlist = [[NSMutableArray alloc]init];
    }
    else
    {
        dataFromPlist = [NSMutableArray arrayWithContentsOfFile:plistPath];
    }
    return dataFromPlist;

}

@end
