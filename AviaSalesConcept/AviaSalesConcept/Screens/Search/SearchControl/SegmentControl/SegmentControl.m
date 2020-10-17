//
//  SegmentControl.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 15.10.2020.
//

#import "SegmentControl.h"

@implementation SegmentControl

// TODO: Вынести кнопки как внешние зависимости
- (UIButton*) selectedButton {
    if (_selectedButton == nil) {
        UIButton* button = [UIButton new];
        button.backgroundColor = [UIColor colorNamed:@"selectedSegment"];
        [button setTitle:@"В одну сторону" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        button.contentEdgeInsets = UIEdgeInsetsMake(4, 16, 4, 16);
        button.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
        _selectedButton = button;
    }
    
    return _selectedButton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.layer.cornerRadius = 4;
    self.layer.shadowColor = [UIColor.blackColor colorWithAlphaComponent:0.25].CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 1;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    
    self.buttons = @[
        self.selectedButton,
        [UIButton new]
    ];
    
    [self addSubview:self.selectedButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.selectedButton.leftAnchor constraintEqualToAnchor: self.leftAnchor constant:7],
        [self.selectedButton.topAnchor constraintEqualToAnchor: self.topAnchor constant:7],
        [self.selectedButton.bottomAnchor constraintEqualToAnchor: self.bottomAnchor constant:-7],
    ]];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height / 2;
    
    self.selectedButton.layer.cornerRadius = self.selectedButton.bounds.size.height / 2;
}

@end
