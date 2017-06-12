//
//  RLLocation.h
//  SpotOn
//
//  Created by Rafael Lopez on 10/21/16.
//  Copyright © 2016 Rflpz. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface RLLocation : NSObject<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@end
