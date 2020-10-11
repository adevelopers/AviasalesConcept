//
//  AppDelegate.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 10.10.2020.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "DataManager.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [UIWindow new];
    [self.window setRootViewController: [[UINavigationController alloc] initWithRootViewController: [MainViewController new]]];
    [self.window makeKeyAndVisible];
    
    
    [[DataManager shared] loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDataLoaded) name:kDataManagerLoadDataDidComplete object:nil];
    
    
    return YES;
}

- (void)handleDataLoaded {
    NSLog(@"✈️ Airports: %lu", (unsigned long)[DataManager shared].airports.count);
}

@end
