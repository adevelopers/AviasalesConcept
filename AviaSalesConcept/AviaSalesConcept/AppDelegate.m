//
//  AppDelegate.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 10.10.2020.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "APIManager.h"
#import "NavigationController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [UIWindow new];
    [self.window setRootViewController: [[NavigationController alloc] initWithRootViewController: [MainViewController new]]];
    [self.window makeKeyAndVisible];
  
    
    [[DataManager shared] loadData];
//    RequestCondition* condition =[RequestCondition new];
//    condition.origin = @"MOW";
//    condition.destination = @"NYC";
//    [[APIManager shared] ticketsWithRequest:condition withCompletion:^(NSArray* tickets) {
//        NSLog(@"%@", tickets);
//    }];
    
    return YES;
}

- (void)handleDataLoaded {
    NSLog(@"✈️ Airports: %lu", (unsigned long)[DataManager shared].airports.count);
}

@end
