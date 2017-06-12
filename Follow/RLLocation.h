//
//  RLLocation.h
//  Follow
//
//  Created by Rafael Lopez on 6/11/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//



#import <Foundation/Foundation.h>
@import CoreLocation;

@interface RLLocation : NSObject<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@end
