//
//  ViewController.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 10.10.2020.
//

#import "MainViewController.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    [self.view addSubview: self.userNameLabel];
    [self.view addSubview: self.userAvatarView];
    [self.view addSubview: self.userSubtitleLabel];
    
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
    ]];
    
    NSLog(@"didLoad");
    
}


@end
