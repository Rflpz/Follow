//
//  RLMapController.m
//  Follow
//
//  Created by Rafael Lopez on 6/11/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//

#import "RLMapController.h"
#import "RLLocation.h"
#import "RLManager.h"
@import MapKit;

@interface RLMapController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) RLLocation *rlLocation;
@end

@implementation RLMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    self.title = @"MAP";
    _rlLocation = [[RLLocation alloc] init];
    [[RLManager sharedInstance] customizeNavigationControllerOfController:self];
}

@end
