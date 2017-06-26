//
//  RLProfileController.m
//  Follow
//
//  Created by Rafael Lopez on 6/15/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//

#import "RLProfileController.h"
#import "RLManager.h"
@interface RLProfileController ()

@end

@implementation RLProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    [[RLManager sharedInstance] customizeNavigationControllerOfController:self];
    self.title = @"PROFILE";
}


@end
