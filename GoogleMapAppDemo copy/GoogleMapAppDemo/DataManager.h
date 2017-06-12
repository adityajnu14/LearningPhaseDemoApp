//
//  DataManager.h
//  GoogleMapAppDemo
//
//  Created by Aditya Kumar on 06/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+(instancetype)sharedManager;

-(void)getDataFromJsonWithURL:(NSString*)URLString withComlitionHandler:(void (^)(NSMutableSet*))handler;

@end
