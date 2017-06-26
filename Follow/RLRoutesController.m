//
//  RLRoutesController.m
//  Follow
//
//  Created by Rafael Lopez on 6/15/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//

#import "RLRoutesController.h"
#import "RLManager.h"
@interface RLRoutesController ()

@end

@implementation RLRoutesController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
    [[RLManager sharedInstance] customizeNavigationControllerOfController:self];
    self.title = @"ROUTES";
}



@end
