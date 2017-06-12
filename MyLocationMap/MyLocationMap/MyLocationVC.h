//
//  MyLocationVC.h
//  MyLocationMap
//
//  Created by Aditya Kumar on 31/01/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

This is old style of coding runs before ios8 
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MyLocationVC : UIViewController<MKMapViewDelegate>

@property (nonatomic, strong)IBOutlet MKMapView* mapView;

@end
