//
//  DataManager.m
//  GoogleMapAppDemo
//
//  Created by Aditya Kumar on 06/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import <GoogleMaps/GoogleMaps.h>
#import "GoogleMarker.h"
#import "WebServiceManager.h"
#import "DataManager.h"
@implementation DataManager

+(instancetype)sharedManager
{
    static DataManager* sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[DataManager alloc]init];
    });
    return  sharedManager;
}

- (void)getDataFromJsonWithURL:(NSString *)URLString withComlitionHandler:(void (^)(NSMutableSet *))handler
{
    [WebServiceManager fetchMapDataForURL:@"" withComlitionHandler:^(NSData* dataFromMap) {
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:dataFromMap options:0 error:nil];
        NSArray* mapData = [jsonData objectForKey:@"results"];
        handler([self createMarkerObjectWithJson:mapData]);
    }];
}

- (NSMutableSet*)createMarkerObjectWithJson:(NSArray*)json
{
    NSMutableSet* mutableMarkerSet = [[NSMutableSet alloc]init];
    for(NSDictionary* markerData in json)
    {
        GoogleMarker* newMarker = [[GoogleMarker alloc]init];
        newMarker.googleMarkderId = [markerData objectForKey:@"id"];
        newMarker.position = CLLocationCoordinate2DMake([[markerData valueForKeyPath:@"geometry.location.lat"] doubleValue], [[markerData valueForKeyPath:@"geometry.location.lng"] doubleValue]);
        newMarker.title = [markerData objectForKey:@"name"];
        newMarker.snippet = [markerData objectForKey:@"vicinity"];
        newMarker.map = nil;
        [mutableMarkerSet addObject:newMarker];
    }
    return mutableMarkerSet;
}

@end
