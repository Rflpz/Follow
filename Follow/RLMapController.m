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

typedef enum {
    Play = 0,
    Pause = 1,
    Stop =2
} OnStatus;

@interface RLMapController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnTrack;
@property (strong, nonatomic) RLLocation *rlLocation;
@property  OnStatus *currentStatus;
@property (weak, nonatomic) IBOutlet UIButton *btnPause;

@end

@implementation RLMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    self.title = @"MAP";
    _rlLocation = [[RLLocation alloc] init];
    [[RLManager sharedInstance] customizeNavigationControllerOfController:self];
    _mapView.tintColor = [[RLManager sharedInstance] colorFromHexString:@"#63f9e0"];
    _mapView.showsUserLocation=YES;
    [_mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    _currentStatus = (OnStatus *)Play;
    [_btnPause setImage:[[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:@"ic_pause"] scaledToSize:CGSizeMake(35, 35)] forState:UIControlStateNormal];
}
- (void)setIconForTrackButton{
    UIImage *statusImage;
    switch ((int)_currentStatus) {
        case Play:
            statusImage = [UIImage imageNamed:@"ic_play"];
            break;
        case Stop:{
            statusImage = [UIImage imageNamed:@"ic_stop"];
            break;
        }
        default:
            statusImage = [UIImage imageNamed:@"ic_play"];
            break;
    }
    [_btnTrack setImage:[[RLManager sharedInstance] imageWithImage:statusImage scaledToSize:CGSizeMake(50, 50)] forState:UIControlStateNormal];
}
- (IBAction)setStatus:(id)sender {
    switch ((int)_currentStatus) {
        case Play:{
            _currentStatus = (OnStatus *) Stop;
            _btnPause.hidden = NO;
            break;
        }
        case Stop:{
            _currentStatus = (OnStatus *) Play;
            _btnPause.hidden = YES;
            break;
        }
        default:
            break;
    }
    [self setIconForTrackButton];
}
- (IBAction)setPause:(id)sender {
    _btnPause.hidden = YES;
    _currentStatus = (OnStatus *)Play;
    [self setIconForTrackButton];
}
@end
