//
//  LakeMapViewController.m
//  GoogleMapAppDemo
//
//  Created by Aditya Kumar on 03/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import <GoogleMaps/GoogleMaps.h>
#import "GoogleMarker.h"
#import "Define.h"
#import "DataManager.h"
#import "MapViewController.h"

@interface MapViewController () <GMSMapViewDelegate>
@property (nonatomic, weak) IBOutlet GMSMapView* myGoogleMapView;

@property (nonatomic, strong) GoogleMarker* userCreatedMarkder;

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
    [self setMyGoogleMapView];
}

- (void)drawMarkers
{
    for(GoogleMarker* marker in _markers)
    {
        if(marker.map == nil)
        marker.map = self.myGoogleMapView;
    }
    if(self.userCreatedMarkder != nil && self.userCreatedMarkder.map == nil)
    {
        self.userCreatedMarkder.map = self.myGoogleMapView;
        self.myGoogleMapView.selectedMarker = self.userCreatedMarkder;
        GMSCameraUpdate* cameraUpdate = [GMSCameraUpdate setTarget:self.userCreatedMarkder.position];
        [self.myGoogleMapView animateWithCameraUpdate:cameraUpdate];
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
        [self drawMarkers];
        
    }];
}


#pragma mark - GMSMapView delegate

- (nullable UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GoogleMarker *)marker
{
    UIView* infoWindow = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 70)];
    [infoWindow setBackgroundColor:[UIColor whiteColor]];
    UILabel* titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 , 5, 180, 30)];
    titleLabel.text = marker.title;
    UILabel* snipptLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 , 37, 180, 30)];
    snipptLabel.text = marker.snippet;
    [infoWindow addSubview:titleLabel];
    [infoWindow addSubview:snipptLabel];
    return  infoWindow;
}

//- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker
//{
//    if(self.myGoogleMapView.myLocation != nil)
//    {
//        NSString* urlString = [NSString stringWithFormat:
//                               @"https://maps.googleapis.com/maps/api/directions/json?origin=%f,%f&destination=%f,%f&key=%@",self.myGoogleMapView.myLocation.coordinate.latitude,self.myGoogleMapView.myLocation.coordinate.longitude,self.userCreatedMarkder.position.latitude,self.userCreatedMarkder.position.longitude,kGoogleAPIKey];
//        NSURL* directionURL  = [NSURL URLWithString:urlString];
//        NSURLSession* session = [NSURLSession d]
//        NSURLSessionDataTask* directionTask =
//        
//    }
//    return YES;
//}

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    if(self.userCreatedMarkder != nil)
    {
        self.userCreatedMarkder.map = nil;
        self.userCreatedMarkder = nil;
    }
    GMSGeocoder* geocoder = [GMSGeocoder geocoder];
    [geocoder reverseGeocodeCoordinate:coordinate completionHandler:^(GMSReverseGeocodeResponse * _Nullable response, NSError * _Nullable error) {
        GoogleMarker* marker = [[GoogleMarker alloc]init];
        marker.position = coordinate;
        marker.appearAnimation = kGMSMarkerAnimationPop;
        marker.map = nil;
        marker.title = response.firstResult.thoroughfare;
        marker.snippet = response.firstResult.locality;
        marker.icon = [GoogleMarker markerImageWithColor:[UIColor greenColor]];
        self.userCreatedMarkder = marker;
        [self drawMarkers];
    }];
}



@end
