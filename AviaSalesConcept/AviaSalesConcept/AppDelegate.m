//
//  AppDelegate.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 10.10.2020.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [UIWindow new];
    [self.window setRootViewController: [MainViewController new]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
