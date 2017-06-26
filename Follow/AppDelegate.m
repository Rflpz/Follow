//
//  AppDelegate.m
//  Follow
//
//  Created by Rafael Lopez on 6/11/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//

#import "AppDelegate.h"
#import "RLMapController.h"
#import "RLProfileController.h"
#import "RLRoutesController.h"
#import "RLManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    _tabController = [[UITabBarController alloc]init];
    _tabController.tabBar.translucent = NO;
    RLMapController *mapController = [[RLMapController alloc] initWithNibName:@"RLMapController" bundle:nil];
    RLProfileController *profileController = [[RLProfileController alloc] initWithNibName:@"RLProfileController" bundle:nil];
    RLRoutesController *routesController = [[RLRoutesController alloc] initWithNibName:@"RLRoutesController" bundle:nil];
    
    mapController.tabBarItem = [self geTabBarItemWithImageName:@"map_ic" withTitle:@"MAP"];
    profileController.tabBarItem = [self geTabBarItemWithImageName:@"profile_ic" withTitle:@"PROFILE"];
    routesController.tabBarItem = [self geTabBarItemWithImageName:@"routes_ic" withTitle:@"ROUTES"];
    
    UINavigationController *navMap = [self getNavigationController];
    UINavigationController *navProfile = [self getNavigationController];
    UINavigationController *navRoutes = [self getNavigationController];

    [navMap pushViewController:mapController animated:YES];
    [navProfile pushViewController:profileController animated:YES];
    [navRoutes  pushViewController:routesController animated:YES];
    
    _tabController.viewControllers = [NSArray arrayWithObjects:navMap, navRoutes, navProfile,nil];
    
    [[UITabBar appearance] setBarTintColor:[[RLManager sharedInstance] colorFromHexString:@"#FFFFFF"]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Avenir-Medium" size:10.0f], NSFontAttributeName,  [[RLManager sharedInstance] colorFromHexString:@"#808080"], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Avenir-Medium" size:10.0f], NSFontAttributeName,  [[RLManager sharedInstance] colorFromHexString:@"#6365f8"], NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    [_window setTintColor:[[RLManager sharedInstance] colorFromHexString:@"#6365f8"]];

    _window.rootViewController = _tabController;

    [self.window makeKeyAndVisible];
    return YES;
}
- (UITabBarItem *)geTabBarItemWithImageName:(NSString *)nameImage withTitle:(NSString *)title{
    UITabBarItem *tabBar = [[UITabBarItem alloc]initWithTitle:title image:nil tag:0];

    if ([title isEqualToString:@"MAP"]) {
        [tabBar setImage: [[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:nameImage] scaledToSize:CGSizeMake(23.5,23.5)]];
        [tabBar setSelectedImage: [[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",nameImage]] scaledToSize:CGSizeMake(23.5,23.5)]];
    }
    
    if ([title isEqualToString:@"PROFILE"]) {
        [tabBar setImage: [[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:nameImage] scaledToSize:CGSizeMake(19,19)]];
        [tabBar setSelectedImage: [[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",nameImage]] scaledToSize:CGSizeMake(19,19)]];
    }
    
    if ([title isEqualToString:@"ROUTES"]) {
        [tabBar setImage: [[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:nameImage] scaledToSize:CGSizeMake(17,17)]];
        [tabBar setSelectedImage: [[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",nameImage]] scaledToSize:CGSizeMake(17,17)]];
    }
    return tabBar ;
}
- (UINavigationController *)getNavigationController{
    return [[UINavigationController alloc] initWithNibName:@"UINavigationController" bundle:nil];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
