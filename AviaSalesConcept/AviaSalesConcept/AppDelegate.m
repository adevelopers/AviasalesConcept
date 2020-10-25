//
//  AppDelegate.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 10.10.2020.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MapViewController.h"
#import "APIManager.h"
#import "NavigationController.h"
#import "TabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [UIWindow new];
    self.window.backgroundColor = UIColor.whiteColor;
    
    [self assemblyModules];
    
    
    [[DataManager shared] loadData];
    
    return YES;
}

- (void)assemblyModules {
    [self setupTabBarAppearance];
    TabBarController* tabbarController = [TabBarController new];
    
    UIViewController* mainFlowController = [[NavigationController alloc] initWithRootViewController: [MainViewController new]];
    mainFlowController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"Home"] tag:1];
    
    UIViewController* mapFlowController = [[NavigationController alloc] initWithRootViewController:[MapViewController new]];
    mapFlowController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage systemImageNamed:@"globe"] tag:2];
    
    [tabbarController setViewControllers:@[
        mainFlowController,
        mapFlowController
    ]];
    
    [self.window setRootViewController: tabbarController];
    [self.window makeKeyAndVisible];
  
}

- (void)setupTabBarAppearance {
    [UITabBar appearance].tintColor = [UIColor colorNamed:@"tabBarItemSelected"];
    [UITabBar appearance].unselectedItemTintColor = [UIColor colorNamed:@"tabBarItem"];
}


- (void)handleDataLoaded {
    NSLog(@"✈️ Airports: %lu", (unsigned long)[DataManager shared].airports.count);
}

@end
