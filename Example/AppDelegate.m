//
//  AppDelegate.m
//  Example
//
//  Created by andyou on 1/17/20.
//  Copyright © 2020 andyou. All rights reserved.
//

#import "AppDelegate.h"

#define TEST_FLUTTER 0
#if TEST_FLUTTER
#import <flutter_integration/FlutterIntegrationManager.h>
#import <flutter_integration/FlutterIntegrationHostViewController.h>
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

#if TEST_FLUTTER
    [[FlutterIntegrationManager sharedInstance] initEngine];
#endif
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
//    if (@available(iOS 13.0,*)) {
//        self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
//    }

    UITabBarController *tabVC = [[UITabBarController alloc] init];
    UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];

    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = UIColor.whiteColor;
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab1" image:nil tag:0];
    vc1.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -16);
    
#if TEST_FLUTTER
    FlutterIntegrationHostViewController *vc2 = [[FlutterIntegrationHostViewController alloc] initWithRouteName:@"test" params:nil];
#else
    UIViewController *vc2 = [[UIViewController alloc] init];
#endif
    
    vc2.view.backgroundColor = UIColor.grayColor;
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab2" image:nil tag:0];
    vc2.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -16);
    tabVC.viewControllers = @[vc1, vc2];

    self.window.rootViewController = rvc;
    return YES;
}

@end
