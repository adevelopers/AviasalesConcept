//
//  ViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 10.10.2020.
//

#import "MainViewController.h"
#import "RestorantsViewController.h"
#import "SearchViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (UILabel*)userNameLabel {
    if (_userNameLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Ivone";
        label.font = [UIFont systemFontOfSize:24 weight: UIFontWeightBold];
        label.textColor = [UIColor colorNamed:@"textPrimary"];
        label.backgroundColor = UIColor.clearColor;
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _userNameLabel = label;
    }
    return _userNameLabel;
}

- (UIImageView*)userAvatarView {
    
    if (_userAvatarView == nil) {
        UIImageView* view = [UIImageView new];
        view.contentMode = UIViewContentModeScaleAspectFit;
        view.image = [UIImage imageNamed:@"ava1"];
        view.layer.cornerRadius = 30;
        view.layer.masksToBounds = true;
        
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _userAvatarView = view;
    }
    return _userAvatarView;
}

- (UILabel*)userSubtitleLabel {
    if (_userSubtitleLabel == nil) {
        UILabel* label = [UILabel new];
        label.textColor = [UIColor colorNamed:@"textSecond"];
        label.text = @"Лето, время взять билет и махнуть на пляж ";
        label.numberOfLines = 0;
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _userSubtitleLabel = label;
    }
    
    return  _userSubtitleLabel;
}


- (UIButton*)flightsButton {
    if (_flightsButton == nil) {
        UIButton* button = [UIButton new];
        
        button.tintColor = UIColor.whiteColor;
        [button setImage:[UIImage imageNamed:@"Flight"] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorNamed:@"flights"];
        
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [button addTarget:self action:@selector(didTapSearch) forControlEvents: UIControlEventTouchUpInside];
        
        // Shadow
        button.layer.cornerRadius = 16;
        button.layer.masksToBounds = NO;
        button.layer.shadowOffset = CGSizeMake(0, 5);
        button.layer.shadowRadius = 5;
        button.layer.shadowOpacity = 0.5;
        button.layer.shadowColor = [UIColor colorNamed:@"flights"].CGColor;
        
        //
        _flightsButton = button;
    }
    
    return  _flightsButton;
}


- (UIButton*)restorantsButton {
    if (_restorantsButton == nil) {
        UIButton* button = [UIButton new];
        [button setImage: [UIImage imageNamed:@"resto"] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorNamed:@"resto"];
        
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [button addTarget:self action:@selector(didTap) forControlEvents: UIControlEventTouchUpInside];
        
        // Shadow
        button.layer.cornerRadius = 16;
        button.layer.masksToBounds = NO;
        button.layer.shadowOffset = CGSizeMake(0, 5);
        button.layer.shadowRadius = 5;
        button.layer.shadowOpacity = 0.5;
        button.layer.shadowColor = [UIColor colorNamed:@"resto"].CGColor;
        
        //
        _restorantsButton = button;
    }
    
    return  _restorantsButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = UIColor.blackColor;
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    [self.view addSubview: self.userNameLabel];
    [self.view addSubview: self.userAvatarView];
    [self.view addSubview: self.userSubtitleLabel];
    [self.view addSubview: self.restorantsButton];
    [self.view addSubview: self.flightsButton];
    
    
    
    NSLayoutConstraint* userAvatarRight = [self.userAvatarView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant:-16];
    userAvatarRight.priority = 1000;
    NSLayoutConstraint* userSubtitleRightToAvatarLeft = [self.userSubtitleLabel.rightAnchor constraintEqualToAnchor: self.userAvatarView.leftAnchor constant:-8];
    userSubtitleRightToAvatarLeft.priority = 999;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.userNameLabel.leftAnchor constraintEqualToAnchor: self.view.leftAnchor constant:16],
        [self.userNameLabel.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant:16],
        [self.userNameLabel.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:16],
        [self.userNameLabel.heightAnchor constraintEqualToConstant:30],
        
        userAvatarRight,
        [self.userAvatarView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:16],
        [self.userAvatarView.widthAnchor constraintEqualToConstant:60],
        [self.userAvatarView.heightAnchor constraintEqualToConstant:60],
        
        [self.userSubtitleLabel.topAnchor constraintEqualToAnchor: self.userNameLabel.bottomAnchor constant:0],
        [self.userSubtitleLabel.leftAnchor constraintEqualToAnchor: self.view.leftAnchor constant:16],
        userSubtitleRightToAvatarLeft,
        
        [self.restorantsButton.topAnchor constraintEqualToAnchor: self.userSubtitleLabel.bottomAnchor constant:48],
        [self.restorantsButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.restorantsButton.widthAnchor constraintEqualToConstant:60],
        [self.restorantsButton.heightAnchor constraintEqualToConstant:60],
        
        [self.flightsButton.topAnchor constraintEqualToAnchor: self.userSubtitleLabel.bottomAnchor constant:48],
        [self.flightsButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:64],
        [self.flightsButton.widthAnchor constraintEqualToConstant:60],
        [self.flightsButton.heightAnchor constraintEqualToConstant:60],
        
    ]];
    
    NSLog(@"didLoad");
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _restorantsButton.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect: _restorantsButton.bounds cornerRadius:16].CGPath;
}

- (void) didTap {
    NSLog(@"did tap");
    RestorantsViewController* controller = [RestorantsViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) didTapSearch {
    SearchViewController* controller = [SearchViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
