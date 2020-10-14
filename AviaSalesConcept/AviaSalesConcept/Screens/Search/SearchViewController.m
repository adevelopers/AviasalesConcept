//
//  SearchViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (SearchControl*)searchControl {
    
    if (_searchControl == nil) {
        SearchControl* control = [SearchControl new];
        [control setTranslatesAutoresizingMaskIntoConstraints:NO];
        _searchControl = control;
    }
    
    return _searchControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    [self.view addSubview:self.searchControl];
    
    [NSLayoutConstraint activateConstraints:@[
        [_searchControl.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [_searchControl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [_searchControl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        [_searchControl.heightAnchor constraintEqualToConstant:357],
    ]];
}

@end
