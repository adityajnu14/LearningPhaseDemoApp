//
//  LakeMapViewController.m
//  GoogleMapAppDemo
//
//  Created by Aditya Kumar on 03/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import <GoogleMaps/GoogleMaps.h>
#import "GoogleMarker.h"
#import "DataManager.h"
#import "MapViewController.h"

@interface MapViewController () <GMSMapViewDelegate>
@property (nonatomic, weak) IBOutlet GMSMapView* myGoogleMapView;

@property (nonatomic, copy) NSMutableSet* markers;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myGoogleMapView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self getDataFromGoogleMap];
}

- (void)drawMarkers
{
    for(GoogleMarker* marker in _markers)
    {
        if(marker.map == nil)
        marker.map = self.myGoogleMapView;
    }
}

- (void)setMyGoogleMapView
{
    GoogleMarker* currPosition = [self.markers anyObject];
    GMSCameraPosition* cameraPosition = [GMSCameraPosition cameraWithLatitude:currPosition.position.latitude longitude:currPosition.position.longitude zoom:15 bearing:0 viewingAngle:0];
    self.myGoogleMapView.camera = cameraPosition;
    self.myGoogleMapView.mapType = kGMSTypeNormal;
    self.myGoogleMapView.myLocationEnabled = YES;
    self.myGoogleMapView.settings.compassButton = YES;
    self.myGoogleMapView.settings.myLocationButton = YES;
}

- (void)getDataFromGoogleMap
{
    DataManager* dataManager = [DataManager sharedManager];
    [dataManager getDataFromJsonWithURL:@"" withComlitionHandler:^(NSMutableSet* markerData) {
        self.markers = [markerData mutableCopy];
        [self setMyGoogleMapView];
        [self drawMarkers];
        
    }];
}


#pragma mark - GMSMapView delegate

- (nullable UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GoogleMarker *)marker
{
    UIView* infoWindow = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 70)];
    infoWindow.backgroundColor = [UIColor lightGrayColor];
    UILabel* titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 , 5, 180, 30)];
    titleLabel.text = marker.title;
    titleLabel.backgroundColor = [UIColor whiteColor];
    UILabel* snipptLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 , 37, 180, 30)];
    snipptLabel.text = marker.snippet;
    [snipptLabel setBackgroundColor:[UIColor whiteColor]];
    [infoWindow addSubview:titleLabel];
    [infoWindow addSubview:snipptLabel];
    return  infoWindow;
}


@end
