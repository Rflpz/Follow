//
//  RLLocation.m
//  SpotOn
//
//  Created by Rafael Lopez on 10/21/16.
//  Copyright © 2016 Rflpz. All rights reserved.
//

#import "RLLocation.h"
@import CoreLocation;
@import UIKit;
@implementation RLLocation
- (id)init{
    if (self = [super init]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
            [self.locationManager requestWhenInUseAuthorization];
        [_locationManager startUpdatingLocation];
    }
    return self;
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    if ((newLocation.coordinate.latitude != 0.0) && (newLocation.coordinate.longitude != 0.0)) {
        _currentLocation = newLocation;
    }
}
@end
