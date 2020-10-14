//
//  SearchControl.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 14.10.2020.
//

#import "SearchControl.h"


@implementation SearchControl


- (UIImageView *)backImageView {
    if (_backImageView == nil) {
        UIImageView* view = [UIImageView new];
//        view.contentMode = UIViewContentModeScaleAspectFill;
        view.contentMode = UIViewContentModeCenter;
        view.image = [UIImage imageNamed:@"search_map"];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _backImageView = view;
    }
    
    return _backImageView;
}

- (UIButton *)switchButton {
    if (_switchButton == nil) {
        UIButton* button = [UIButton new];
        [button setImage:[UIImage imageNamed:@"switch"] forState: normal];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        _switchButton = button;
    }
    
    return _switchButton;
}

- (PickableLabel*)departureAirportLabel {
    if (_departureAirportLabel == nil) {
        PickableLabel* label = [PickableLabel new];
        label.text = @"NYC";
        label.textColor = UIColor.whiteColor;
        [label setUserInteractionEnabled:YES];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _departureAirportLabel = label;
    }
    
    return _departureAirportLabel;
}

- (PickableLabel*)arrivalAirportLabel {
    if (_arrivalAirportLabel == nil) {
        PickableLabel* label = [PickableLabel new];
        label.text = @"MOW";
        label.textColor = UIColor.whiteColor;
        [label setUserInteractionEnabled:YES];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _arrivalAirportLabel = label;
    }
    
    return _arrivalAirportLabel;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorNamed:@"searchControlBgEnd"];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.backImageView];
    [self addSubview:self.switchButton];
    [self addSubview:self.departureAirportLabel];
    [self addSubview:self.arrivalAirportLabel];
    
    NSLayoutConstraint* bottom = [_backImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
    bottom.priority = 1000;
    
    [NSLayoutConstraint activateConstraints:@[
        [_backImageView.leftAnchor constraintEqualToAnchor:self.leftAnchor],
        [_backImageView.rightAnchor constraintEqualToAnchor:self.rightAnchor],
        bottom,
        
        [_switchButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [_switchButton.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:16],
        
        [_departureAirportLabel.centerYAnchor constraintEqualToAnchor:self.switchButton.centerYAnchor constant:-64],
        [_departureAirportLabel.leftAnchor constraintEqualToAnchor:self.switchButton.rightAnchor constant:16],
        
        [_arrivalAirportLabel.centerYAnchor constraintEqualToAnchor:self.switchButton.centerYAnchor constant:64],
        [_arrivalAirportLabel.leftAnchor constraintEqualToAnchor:self.switchButton.rightAnchor constant:16],
    ]];
    
    __weak SearchControl* _self = self;
    self.departureAirportLabel.didItemSelected = ^(NSString* value){
        _self.departureAirportLabel.text = [NSString stringWithFormat:@"%@", value];
    };
    
    self.arrivalAirportLabel.didItemSelected = ^(NSString* value){
        _self.arrivalAirportLabel.text = [NSString stringWithFormat:@"%@", value];
    };
    
    
    
}

@end
