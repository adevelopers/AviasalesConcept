//
//  FlightCell.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import "FlightCell.h"

@implementation FlightCell

+ (NSString *)reuseId {
    return @"FlightCell";
}

- (UIView *)underlayContentView {
    if (_underlayContentView == nil) {
        UIView* view = [UIView new];
        view.layer.cornerRadius = 4;
        view.backgroundColor = UIColor.whiteColor;
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        view.layer.shadowColor = [UIColor.blackColor colorWithAlphaComponent:0.25].CGColor;
        view.layer.shadowRadius = 5;
        view.layer.shadowOpacity = 1;
        view.layer.shadowOffset = CGSizeMake(2, 2);
        
        _underlayContentView = view;
    }
    return _underlayContentView;
}


- (CAShapeLayer *)flightLineLayer {
    if (_flightLineLayer == nil) {
        CAShapeLayer* layer = [CAShapeLayer new];
        layer.strokeColor = UIColor.grayColor.CGColor;
        layer.lineWidth = 1;
        layer.lineDashPattern = @[@(8), @(8)];
        _flightLineLayer = layer;
    }
    return _flightLineLayer;
}

- (CAShapeLayer *)separatorLineLayer {
    if (_separatorLineLayer == nil) {
        CAShapeLayer* layer = [CAShapeLayer new];
        layer.strokeColor = [[UIColor colorNamed:@"searchFormCaption"] colorWithAlphaComponent:0.5].CGColor;
        layer.lineWidth = 1;
        _separatorLineLayer = layer;
    }
    return _separatorLineLayer;
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Flight"]];
        _iconImageView.tintColor = UIColor.blackColor;
        [_iconImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return  _iconImageView;
}

- (UIImageView *)aircompanyLogoView {
    if (_aircompanyLogoView == nil) {
        UIImageView* view = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"aircompany"]];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _aircompanyLogoView = view;
    }
    return _aircompanyLogoView;
}

- (UILabel *)departureAirportLabel {
    if (_departureAirportLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"MOW";
        label.textColor = [UIColor colorNamed:@"searchFormCaption"];
        label.font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _departureAirportLabel = label;
    }
    return _departureAirportLabel;
}

- (UILabel *)arrivalAirportLabel {
    if (_arrivalAirportLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"NYC";
        label.textColor = [UIColor colorNamed:@"searchFormCaption"];
        label.font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _arrivalAirportLabel = label;
    }
    
    return _arrivalAirportLabel;
}

- (UILabel *)departureTimeLabel {
    if (_departureTimeLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"13:00";
        label.textColor = [UIColor colorNamed:@"searchFormValue"];
        label.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _departureTimeLabel = label;
    }
    
    return _departureTimeLabel;
}

- (UILabel *)arrivalTimeLabel {
    if (_arrivalTimeLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"15:10";
        label.textColor = [UIColor colorNamed:@"searchFormValue"];
        label.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _arrivalTimeLabel = label;
    }
    
    return _arrivalTimeLabel;
}


- (UILabel *)flightLabel {
    if (_flightLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"SG-161";
        label.textColor = [UIColor colorNamed:@"searchFormCaption"];
        label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _flightLabel = label;
    }
    return _flightLabel;
}

- (UILabel *)priceLabel {
    if (_priceLabel == nil) {
        UILabel* label = [UILabel new];
        label.text = @"14 200 ₽";
        label.textColor = [UIColor colorNamed:@"searchFormValue"];
        label.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        _priceLabel = label;
    }
    
    return _priceLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void) setupUI {
    self.backgroundColor = UIColor.clearColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.underlayContentView.layer addSublayer:self.flightLineLayer];
    [self.underlayContentView.layer addSublayer:self.separatorLineLayer];
    
    
    [self.contentView addSubview:self.underlayContentView];
    
    [self.underlayContentView addSubview:self.iconImageView];
    [self.underlayContentView addSubview:self.aircompanyLogoView];
    [self.underlayContentView addSubview:self.departureAirportLabel];
    [self.underlayContentView addSubview:self.arrivalAirportLabel];
    [self.underlayContentView addSubview:self.departureTimeLabel];
    [self.underlayContentView addSubview:self.arrivalTimeLabel];
    
    [self.underlayContentView addSubview:self.flightLabel];
    [self.underlayContentView addSubview:self.priceLabel];
    
    
    
    [NSLayoutConstraint activateConstraints:@[
            
            [_underlayContentView.topAnchor constraintEqualToAnchor:self.topAnchor constant:16],
            [_underlayContentView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:16],
            [_underlayContentView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-16],
            [_underlayContentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-16],
        
            [_iconImageView.centerYAnchor constraintEqualToAnchor:self.departureTimeLabel.topAnchor constant:-5],
            [_iconImageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
            
            [_aircompanyLogoView.leftAnchor constraintEqualToAnchor:self.underlayContentView.leftAnchor constant:20],
            [_aircompanyLogoView.bottomAnchor constraintEqualToAnchor:self.underlayContentView.bottomAnchor constant:-11],
            [_aircompanyLogoView.widthAnchor constraintEqualToConstant:30],
            [_aircompanyLogoView.heightAnchor constraintEqualToConstant:30],
            
            [_departureAirportLabel.topAnchor constraintEqualToAnchor:self.underlayContentView.topAnchor constant:19],
            [_departureAirportLabel.leftAnchor constraintEqualToAnchor:self.underlayContentView.leftAnchor constant:20],
            
            [_arrivalAirportLabel.topAnchor constraintEqualToAnchor:self.underlayContentView.topAnchor constant:19],
            [_arrivalAirportLabel.rightAnchor constraintEqualToAnchor:self.underlayContentView.rightAnchor constant:-20],
            
            [_departureTimeLabel.topAnchor constraintEqualToAnchor:self.underlayContentView.topAnchor constant:39],
            [_departureTimeLabel.leftAnchor constraintEqualToAnchor:self.underlayContentView.leftAnchor constant:20],
            
            [_arrivalTimeLabel.topAnchor constraintEqualToAnchor:self.underlayContentView.topAnchor constant:39],
            [_arrivalTimeLabel.rightAnchor constraintEqualToAnchor:self.underlayContentView.rightAnchor constant:-20],
            
            [_flightLabel.centerYAnchor constraintEqualToAnchor:self.aircompanyLogoView.centerYAnchor],
            [_flightLabel.leftAnchor constraintEqualToAnchor:self.aircompanyLogoView.rightAnchor constant:16],
            
            [_priceLabel.centerYAnchor constraintEqualToAnchor:self.aircompanyLogoView.centerYAnchor],
            [_priceLabel.rightAnchor constraintEqualToAnchor:self.underlayContentView.rightAnchor constant:-20],
            
        ]];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _separatorLineLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.bounds.size.height - 80, self.bounds.size.width - 32, 0)].CGPath;
    _flightLineLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(self.contentView.center.x - (164/2) - 16, self.contentView.center.y - 48.5, 164, 0)].CGPath;

}

@end
