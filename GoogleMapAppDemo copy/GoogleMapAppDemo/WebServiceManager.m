//
//  WebServiceManager.m
//  GoogleMapAppDemo
//
//  Created by Aditya Kumar on 06/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "AppDelegate.h"
#import "Define.h"
#import "WebServiceManager.h"

@implementation WebServiceManager


+ (void)fetchMapDataForURL:(NSString *)URLString withComlitionHandler:(void (^)(NSData *))handler
{
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.URLCache = [[NSURLCache alloc]initWithMemoryCapacity:2*1024*1024 diskCapacity:10*1024*1024 diskPath:@"markerData"];
    NSURLSession* markerSession = [NSURLSession sessionWithConfiguration:config];
    
    NSURL* url = [NSURL URLWithString:[kGoogleMapWebURL stringByAppendingString:
                                       [NSString stringWithFormat:@"location=28.61416,77.35515&radius=500&key=%@", kGoogleAPIKey]]];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURLSessionTask* task = [markerSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
            NSLog(@"%@",error.description);
        else
        {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                handler(data);
            }];
            
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    }];
    
    [task resume];

}

@end
  
