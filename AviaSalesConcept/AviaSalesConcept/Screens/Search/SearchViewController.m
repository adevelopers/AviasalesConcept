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

- (SegmentControl *)segmentControl {
    if (_segmentControl == nil) {
        SegmentControl* control = [SegmentControl new];
        control.backgroundColor = UIColor.whiteColor;
        [control setTranslatesAutoresizingMaskIntoConstraints:NO];
        _segmentControl = control;
    }
    
    return _segmentControl;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    [self.view addSubview:self.searchControl];
    [self.view addSubview:self.segmentControl];
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
    self.navigationController.navigationBar.titleTextAttributes = @{
        NSForegroundColorAttributeName: UIColor.whiteColor
    };
    
    self.navigationItem.title = @"Поиск рейсов";
        
    [NSLayoutConstraint activateConstraints:@[
        [_searchControl.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [_searchControl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [_searchControl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        [_searchControl.heightAnchor constraintEqualToConstant:320],
        
        [_segmentControl.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16],
        [_segmentControl.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16],
        [_segmentControl.centerYAnchor constraintEqualToAnchor:self.searchControl.bottomAnchor],
        [_segmentControl.heightAnchor constraintEqualToConstant:57]
        
    ]];
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // чистим ресурсы чтобы небыло sideeffects
    self.searchControl.backImageView.image = nil;
}

- (void)loadAirports {
    
}

@end
