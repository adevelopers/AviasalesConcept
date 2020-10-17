//
//  NavigationController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 16.10.2020.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}


#pragma mark - Navigation

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" "
                                                                                    style: UIBarButtonItemStylePlain
                                                                                    target:nil
                                                                                    action:nil];
    
}


@end
