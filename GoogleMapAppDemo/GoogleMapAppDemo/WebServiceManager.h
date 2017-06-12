//
//  WebServiceManager.h
//  GoogleMapAppDemo
//
//  Created by Aditya Kumar on 06/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceManager : NSObject

+ (void)fetchMapDataForURL:(NSString*)URLString withComlitionHandler:(void (^)(NSData*))handler;

@end
