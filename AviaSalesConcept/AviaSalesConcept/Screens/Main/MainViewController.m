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
        UILabel* label = [[UILabel alloc] initWithFrame: CGRectMake(0, 100, 300, 60)];
        label.text = @"Illona";
        label.font = [UIFont systemFontOfSize:24 weight: UIFontWeightBold];
        label.textColor = UIColor.blackColor;
        label.backgroundColor = UIColor.clearColor;
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _userNameLabel = label;
    }
    return _userNameLabel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"bg"];
    [self.view addSubview: self.userNameLabel];
    
    
    [NSLayoutConstraint activateConstraints:@[
        [self.userNameLabel.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.userNameLabel.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor],
        [self.userNameLabel.heightAnchor constraintEqualToConstant:60]
    ]];
    
    NSLog(@"didLoad");
    
}


@end
