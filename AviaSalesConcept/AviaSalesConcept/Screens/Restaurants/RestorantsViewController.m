//
//  RestorantsViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 11.10.2020.
//

#import "RestorantsViewController.h"

@interface RestorantsViewController ()

@end

@implementation RestorantsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"resto"];
    self.title = @"Рестораны";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    
}


@end
