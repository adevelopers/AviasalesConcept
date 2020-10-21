//
//  ServiceCell.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 21.10.2020.
//

#import "ServiceCell.h"

@implementation ServiceCell



+(NSString*)reuseId {
    return @"ServiceCell";
}

- (UIButton*)flightsButton {
    if (_flightsButton == nil) {
        UIButton* button = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 60, 60)];
        
        button.tintColor = UIColor.whiteColor;
        [button setImage:[UIImage imageNamed:@"Flight"] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorNamed:@"flights"];
        
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];

        
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
        UIButton* button = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 60, 60)];
        [button setImage: [UIImage imageNamed:@"resto"] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorNamed:@"resto"];
        
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        
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

- (UIStackView *)servicesStackView {
    if (_servicesStackView == nil) {
        UIStackView* stackView = [UIStackView new];
        stackView.alignment = UIStackViewAlignmentFill;
        stackView.distribution = UIStackViewDistributionEqualSpacing;
        stackView.spacing = 0;
        [stackView addArrangedSubview:self.flightsButton];
        [stackView addArrangedSubview:self.restorantsButton];
        stackView.backgroundColor = UIColor.clearColor;
        [stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
        _servicesStackView = stackView;
    }
    
    return _servicesStackView;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColor.clearColor;
    [self.contentView addSubview:self.servicesStackView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.servicesStackView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.servicesStackView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.servicesStackView.widthAnchor constraintEqualToConstant:(60*2)+32],
        [self.servicesStackView.heightAnchor constraintEqualToConstant:65],
        
        [self.flightsButton.heightAnchor constraintEqualToConstant:60],
        [self.flightsButton.widthAnchor constraintEqualToConstant:60],
        [self.restorantsButton.heightAnchor constraintEqualToConstant:60],
        [self.restorantsButton.widthAnchor constraintEqualToConstant:60]
    ]];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _restorantsButton.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect: _restorantsButton.bounds cornerRadius:16].CGPath;
}

- (void)setupButtons:(nullable id)target and:(SEL)a and:(SEL)b {
    
    [_flightsButton addTarget:target action:a forControlEvents: UIControlEventTouchUpInside];
    [_restorantsButton addTarget:target action:b forControlEvents: UIControlEventTouchUpInside];
}

@end
