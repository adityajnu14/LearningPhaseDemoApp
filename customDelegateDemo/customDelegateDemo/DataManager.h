//
//  DataManager.h
//  customDelegateDemo
//
//  Created by Aditya Kumar on 10/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
+ (BOOL)saveContactDataToPlistWithName:(NSString*)contactName contact:(NSString*)contactNo;
+ (NSMutableArray*)getContactDataFromPlist;

+ (instancetype)dataManager;

@end
