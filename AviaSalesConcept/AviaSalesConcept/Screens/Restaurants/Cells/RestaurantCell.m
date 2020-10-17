//
//  RestaurantCell.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 12.10.2020.
//

#import "RestaurantCell.h"

@implementation RestaurantCell

- (UIImageView *)logoView {
    
    if (_logoView == nil) {
        UIImageView* view = [UIImageView new];
        view.contentMode = UIViewContentModeScaleAspectFit;
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        _logoView = view;
    }
    
    return  _logoView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _logoView.image = nil;
}

- (void)setupUI {
    [self.contentView addSubview: self.logoView];
    self.backgroundColor = UIColor.blueColor;
    self.layer.cornerRadius = 4;
    self.layer.shadowColor = [UIColor.blackColor colorWithAlphaComponent:0.25].CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 1;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    
    [NSLayoutConstraint activateConstraints:@[
        [self.logoView.centerYAnchor constraintEqualToAnchor: self.centerYAnchor],
        [self.logoView.centerXAnchor constraintEqualToAnchor: self.centerXAnchor],
//        [self.logoView.heightAnchor constraintEqualToAnchor: self.heightAnchor],
//        [self.logoView.heightAnchor constraintEqualToAnchor: self.heightAnchor],
    ]];
    
}

- (void)setImage:(UIImage*)image {
    NSLog(@"setImage");
    self.logoView.image = image;
}

@end
