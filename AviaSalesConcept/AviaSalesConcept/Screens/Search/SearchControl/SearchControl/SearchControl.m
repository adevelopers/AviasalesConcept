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

- (UILabel *)departureCaptionLabel {
    if (_departureCaptionLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Отправление из";
        label.textColor = [UIColor colorNamed:@"captionColor"];
        label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _departureCaptionLabel = label;
    }
    
    return _departureCaptionLabel;
}

- (PickableLabel*)departureAirportLabel {
    if (_departureAirportLabel == nil) {
        PickableLabel* label = [PickableLabel new];
        label.text = @"SLM";
        label.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
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
        label.text = @"BTL";
        label.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
        label.textColor = UIColor.whiteColor;
        [label setUserInteractionEnabled:YES];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _arrivalAirportLabel = label;
    }
    
    return _arrivalAirportLabel;
}

- (UILabel *)arrivalCaptionLabel {
    if (_arrivalCaptionLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Прибытие в";
        label.textColor = [UIColor colorNamed:@"captionColor"];
        label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _arrivalCaptionLabel = label;
    }
    
    return _arrivalCaptionLabel;
}

- (UILabel *)departureCityLabel {
    if (_departureCityLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Sleman, Yogyakarta";
        label.textColor = UIColor.whiteColor;
        label.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _departureCityLabel = label;
    }
    
    return _departureCityLabel;
}


- (UILabel *)arrivalCityLabel {
    if (_arrivalCityLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"Mbantul, Yogyakarta";
        label.textColor = UIColor.whiteColor;
        label.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _arrivalCityLabel = label;
    }
    
    return _arrivalCityLabel;
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
    [self addSubview:self.departureCaptionLabel];
    [self addSubview:self.arrivalCaptionLabel];
    [self addSubview:self.departureAirportLabel];
    [self addSubview:self.arrivalAirportLabel];
    
    [self addSubview:self.departureCityLabel];
    [self addSubview:self.arrivalCityLabel];
    
    self.backImageView.alpha = 0.4;
    
    NSLayoutConstraint* bottom = [_backImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:80];
    bottom.priority = 1000;
    
    [NSLayoutConstraint activateConstraints:@[
        [_backImageView.leftAnchor constraintEqualToAnchor:self.leftAnchor],
        [_backImageView.rightAnchor constraintEqualToAnchor:self.rightAnchor],
        bottom,
        
        [_switchButton.centerYAnchor constraintEqualToAnchor:self.bottomAnchor constant:-136],
        [_switchButton.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:16],
        
        [_departureAirportLabel.centerYAnchor constraintEqualToAnchor:self.switchButton.centerYAnchor constant:-64],
        [_departureAirportLabel.leftAnchor constraintEqualToAnchor:self.switchButton.rightAnchor constant:16],
        
        [_arrivalAirportLabel.centerYAnchor constraintEqualToAnchor:self.switchButton.centerYAnchor constant:64],
        [_arrivalAirportLabel.leftAnchor constraintEqualToAnchor:self.switchButton.rightAnchor constant:16],
        
        [_departureCaptionLabel.bottomAnchor constraintEqualToAnchor:self.departureAirportLabel.topAnchor constant:-2],
        [_departureCaptionLabel.leftAnchor constraintEqualToAnchor:self.switchButton.rightAnchor constant:16],
        
        [_arrivalCaptionLabel.bottomAnchor constraintEqualToAnchor:self.arrivalAirportLabel.topAnchor constant:-2],
        [_arrivalCaptionLabel.leftAnchor constraintEqualToAnchor:self.switchButton.rightAnchor constant:16],
        
        [_departureCityLabel.topAnchor constraintEqualToAnchor:self.departureAirportLabel.bottomAnchor constant:2],
        [_departureCityLabel.leftAnchor constraintEqualToAnchor:self.switchButton.rightAnchor constant:16],
        
        [_arrivalCityLabel.topAnchor constraintEqualToAnchor:self.arrivalAirportLabel.bottomAnchor constant:2],
        [_arrivalCityLabel.leftAnchor constraintEqualToAnchor:self.switchButton.rightAnchor constant:16],
        
        
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
